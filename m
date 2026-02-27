Return-Path: <linux-arm-msm+bounces-94556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGnXLaEsomk/0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 00:45:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E211BF251
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 00:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B7C03025E31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE573E9F8C;
	Fri, 27 Feb 2026 23:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2MAv5XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsUpYmtx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C337BE75
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235693; cv=none; b=t1BIB0RE5F1a34KBjd/pyIXhshZfscTxPQ9jDcDrUWcOf9HxhWDeq0q1vDjV9xzITb4EBm2zF3m1m1ft1QpivGK0gTka8JiZgpqz3aLipCv+4olempiXq197oOjK/M7Wl7IK9e4ufO6muf8aIc868SLSBfvSliwc3wwstv2QXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235693; c=relaxed/simple;
	bh=6QvB7huYMux0VK3w60OaJPQ7kp21zCIfWmT+zsHmKVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akR1ZrwFvr8nrNsi5FBbW2p+2+1PIYfAUmfqNn1w3sGwPkxuORNSJBLfPeotinWMRFK3yeyJaC8pHGAHQ6Kk3+Fm5Xo5l4H849CiToz/771At8WMAwvvLwrKhN7xwCAdJR00bw5O62X3PlglTB1Kx4r9M0vZLwXnkdMmQ2jlZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2MAv5XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsUpYmtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RM68oV2560949
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b4RPVfEauVulPNQw2T/2xBrD
	ug+mzawESETX0L19vj0=; b=k2MAv5XU9/IyucUK2fIrUwROIS0Q0U70c4PayRyx
	d4TK+qUjx3MxyNNleQrDQ7ZsTcQ3dxiuy5J8SLoHFRz/gcGRhbquLpW8P3wZisbW
	s4DHz/5VJvXmcId00Vea4I1hoQJ1x57YP7pCCoilGuG4yOLKyAGnYJ+VGcI2+FQV
	IHmBjWq7RyvspaO7PcV80saLhBs2O6xYczPO2b+sM0XoOCXeurdt+73COjdmEgiV
	kfnRLYtMy51QBgX+kM20S7qWkj89SXVfBdxWE1cxpDRCkUIHpNPqtLkqDaLsUjuN
	KgH971N0TFi8ylHLofX82qPepJFvnfgbOjQZvaUP7MyN8w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckks1r698-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:41:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4d668425dso38065692a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772235686; x=1772840486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4RPVfEauVulPNQw2T/2xBrDug+mzawESETX0L19vj0=;
        b=AsUpYmtxvRWuJV/crLvY3fPnZ+1aY68fgXTWqdhcWh9lkGtof6po71QIP1a10ciVGN
         cUtOHFE0dDtY/5x9/crdFR1Ja7RzPyastYU9vLLB9M8WT5H7m9PbCibyd4n9osRiltlN
         YQtMBDN9MaQ7/WO13sGLgz0YnwrDtOchw+RHLPzsMX3Z5kgUMPjFn0El4TTguaSvLIkV
         4X7oBuWAcIcIZjTKTppFzGP/KAZ51MhVxAySvnU5SxAwCoUM/mCe4LK3Px0FCD5dIyoT
         vk2NI2KdFv07YyQRAaoALnm1Xh49aclIpUwAbQGYAbwUgcipH/wg966EyY/p6MZl8qQD
         IRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235686; x=1772840486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4RPVfEauVulPNQw2T/2xBrDug+mzawESETX0L19vj0=;
        b=vrwaZF8g3L7cNdjH1QzXfzov53PC0uIOXBdZDo0n/+ypipin4/2n+V4ny3A5bEHgih
         zkQkEXf0VLm2DMfTUIWmdt/d17R3DaOM/Dp1tmlH0gY+Kz4doMDTuxAkk4EntrDzhvCs
         jnod1OszSdEiUr/hw7hPFhn/clo6Sk6jA5qdsvJeCBOXlUGjHdYPRN2iQolEhmz56DXb
         LqRjVYMJ1BPu2jh1rhLRiIA8MTpSPUzI9YTulz6OmToh471B0FuLVRyX+uIk9Tls1gq7
         tcE4CzVlCcpiMf3YzQyR2v+FwCTXSzWfxfc7b+0bJjBsArIPpz0z5BQBWaJ4jhdvx8ZI
         /OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBIZqRcunX111JLwL3I/11Ljq/tD8eF718Uw5S9i64RY1Ah2EAxSxw+aP5dOSt59sZFvI6ytaCXqC2S1eg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsv38FK0roBzmq+RcSZNWLfRmt3XCTgmtIswRl1Urm2gmoKWXu
	eVkE0OsdvMzLbpsmDo/7tAJFlrtc6/pXbZqh8QfLB0SoQ9i1xnsW/dLQGgXqp5revyJx31sFdMf
	BWMotebUF9ZNsbkP14S513RGr/pG20fnQn4YkczpfY9rbje+jZ1mlQyQaAKvryWz6QeZS
X-Gm-Gg: ATEYQzwZ6J7YyYe+UV5FHJPlr8ykNaAsOaf26Q/hxT2CcB3q1gkMPPhHiGIxBnoWPzC
	WvYz2ywih7aJye8Qrbk7GXxfUf6FOb765px2U91zklpN/4QR9u/jrvuZw1odn4JAmIpBGdVbBn6
	uIjc3u9ke0i2+gOY2c6oFIfuz5YCTvVBOQYpUindIJtngZYRqLiXYYRi10492hUzWj+p8/t8Y4F
	G2NTjsI/1dH1te2dSgqIsuJqyAdDO7rcKucDp+H3fNnNvZ4JTfNhAzJLHfJfuu+FSTsMIrLDPCF
	3aJkfnf13nUElf0C+4vOwqch8IMeiN3Ika1cTp20RXkZ5Wx59sTWsDcGyJmPdd2E4w5a5YmrzSJ
	9Y9psLJEll75HWjOl4eBh+gjI15zAw4R3aNRic3mIxtgneIfIDp74J6c7Q1itCtJSPRhRQqQLfL
	M=
X-Received: by 2002:a05:6808:1391:b0:462:aa0f:4375 with SMTP id 5614622812f47-464beb40bfamr2716105b6e.39.1772235685779;
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
X-Received: by 2002:a05:6808:1391:b0:462:aa0f:4375 with SMTP id 5614622812f47-464beb40bfamr2716093b6e.39.1772235685424;
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb4028cdsm3001607b6e.9.2026.02.27.15.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:41:25 -0800 (PST)
Date: Fri, 27 Feb 2026 15:41:22 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: sysmon: Correct subsys_name_len type in
 QMI request
Message-ID: <aaIrokT+Ovglo/Tj@hu-clew-lv.qualcomm.com>
References: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zg0FhKTjiWDzdTVxira4IV8Vd5AcEQ3E
X-Proofpoint-GUID: zg0FhKTjiWDzdTVxira4IV8Vd5AcEQ3E
X-Authority-Analysis: v=2.4 cv=eNUeTXp1 c=1 sm=1 tr=0 ts=69a22ba6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UyUhSrBohwOpVuKZ7twA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDIxMiBTYWx0ZWRfXwnR7exGI66cn
 NrH37ENT1RuQOivE3TaoIhO/aMgwaijYRu2gQpJ9tnpaCex0y/wjBDIigBS7I/A5Q5Uvg2262K3
 keHJr5u68M/9rA50vWYpYFKKcVby5guTnS3E/mXRJOvBC/UtYoM0pmdP//Sr8v9t132BsiYvEbc
 lU9H0UeGa9qDY2FnGZlSZTnf9t3GVXMoufy7WF+Nn9X2d2OseR/rOmj8zN2oAq03fjd+gKvbXUC
 un25iWnroDKrdBL0N3ekF1+aCAewEXEBPOpHX/svGeYWRqy8h4JzAHAE3OhbMbqfwZCI5UYshmc
 MDF9eIK87dmBOfPLRjgpCexe/NrhNXfMg2zZHvloMPcPmRQUmM98mzPZQuFe/zPq5MM38TOvjA2
 7xu/eRF+hDKfIFZbSeBmrmEIndPR9FX53tqwI4wPb9glzj+t9PJTQMIREYjt5tAY1EvHEZJuyWl
 y+ejzjZY/3GIzC+6VeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270212
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hu-clew-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94556-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03E211BF251
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 03:11:48PM -0600, Bjorn Andersson wrote:
> The QMI message encoder has up until recently read a single byte (as
> elem_size == 1), but with the introduction of big endian support it's
> become apparent that this field is expected to be a full u32 -
> regardless of the size of the length in the encoded message (which is
> what elem_size specifies).
> 
> The result is that the encoder now reads past the length byte and
> rejects the unreasonably large length formed when including the
> following 3 bytes from the subsys_name array.
> 
> Fix this by changing to the expected type.
> 
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> I believe I've checked all the other users now, and this is the only
> case I found that needs fixing.
> 

Did a quick double check on ipa, ath10k, sysmon, pdr, slimbus and usb.

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>


> Changes in v2:
> - Fix the sysmon driver instead of the encoder/decoder
> - Link to v1: https://lore.kernel.org/r/20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 660ac6fc408213073942f20a2c4e43a0c9b9b37e..c6cc6e519fe566a92505dc57c30e8b3e0a697179 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -203,7 +203,7 @@ static const struct qmi_elem_info ssctl_shutdown_resp_ei[] = {
>  };
>  
>  struct ssctl_subsys_event_req {
> -	u8 subsys_name_len;
> +	u32 subsys_name_len;
>  	char subsys_name[SSCTL_SUBSYS_NAME_LENGTH];
>  	u32 event;
>  	u8 evt_driven_valid;
> 
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260214-qmi-encode-invalid-length-310dd551a186
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

