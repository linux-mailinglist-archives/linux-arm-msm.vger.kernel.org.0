Return-Path: <linux-arm-msm+bounces-101632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJESHMKrz2kPzAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:00:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B710393E07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439A6300EF81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21F63BE637;
	Fri,  3 Apr 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hekn4g0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4mHRrHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96884282F33
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217543; cv=none; b=M1xC1bAjUGNElQrGpX5VxQ/XmGWKGMGQPmgYia8vykr5thW4MOD91YdZK5rRzAHatoCFwbAh5GviDs2xmP23LTuX6uiOrlcaK5ew2QwvvMcI88eI2d92Pg2Fo875xicEI+eUekZ9e11NG03Fhl6bYOu5838QGKxVjqK0TDOm8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217543; c=relaxed/simple;
	bh=VdDqFLBRGI8N+m3XIIgjgCnSsQ+lqeTBaslDzgYOLLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E85SGsuoo2Tz3/83MfbS/vzfonuACzWIFxWPpwTCEcSG5REZf8gl/MBSaOwg5i1xZtl4wRI+llDSCuVEPavPofhUzNvcce8zcf056OANZDeCuMgSuhYNsOFH6KnzhAeD76OFcDNuv9Fukx6UIMxPh5/yCnM2pILIszsanrrUO7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hekn4g0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4mHRrHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxIak3803711
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 11:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6FSfCNss0WGbrLRmtEKpCH49PaDXVZ75wV9fa1v334=; b=hekn4g0rkwY8LM+u
	xixae2WYCWWnPmKBpBPD37o1iiyjkeYhBMdU8ClC37SVPcu556dCdNICvKFdodV2
	jzgek+Sisymt4CMeQ6REC9eRHHwHXZ06Yey/KkgTKGmqlh7GSGiZOnro7QIVolPo
	2EwtM7qrskk9u4h3KhCS/T22M4l7qytyN603PGA4K5wlrIHD/Hj9gsHbUGBvY7YX
	Tp4Kucse8b+1eM5lDNyeLNc1eH0VNf9NUBg+fY0N1GMx0KWTrNmQv070zO5NXZoF
	+09dPVIsav1F3rQHj2uL1Qoe+OwCiEWdj15CTwLwZWxlHk7T7QAlgvae5YDKv0B6
	haL6vw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f84d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 11:59:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7423ba5342so2740936a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775217541; x=1775822341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6FSfCNss0WGbrLRmtEKpCH49PaDXVZ75wV9fa1v334=;
        b=K4mHRrHx+SxdjTfdK5FrrWV77UjdBMpFL/4RMrOzeQMgqTR2VdIvcG1FzuqkJ2iH7g
         Iz99Is7SuTJ3hzPyVMjcDUjY0p4Ov7Gf4Q8nqnji+j8yt/L5rpvInTji8iVAEVW9XFEC
         j3pxRFcmD30EO5Nvlq0aCxSKZhWGWE6/L37DZFi27okXYbpJWrZws9VShKFtJMYJ1gSA
         xjfsvpEdGjqhUF33bIjTudF1DQ9+1hC4WzpbRDWn2wD7TmOUilr5ZBzNAphnlM82+ui9
         SwPOkNt755Tz383nrvdIFCYzTY4nm46k428XtV+A8Cv8ABCm4lw4R87EIoTRGXtfgJp6
         tWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217541; x=1775822341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6FSfCNss0WGbrLRmtEKpCH49PaDXVZ75wV9fa1v334=;
        b=QT056t5ufSRSE2SrDUCWrnGtN38jVBncBw7NQW5wuGinYH524GV0XxHcFMPOthw1lt
         MaQ1sqdEKdc0d2PNAxcZpTjngTUGSK/054uW9pGyHx0rQsvrlgz0Y5o4DhwcJa27Ick3
         PCHW5fFVa9LoKvQokZOCj22qoSCfKHZOcVZUDUo8sV+oPbRg2IIYs//YqI4qgoUl4X6s
         2d/y5jT2tDkI2rexRdr6pxSM7Xfj7uVtJE7RGoH9DlC+Sobs1PlwSmTXSxE2TWAuXXGH
         yCHyHzPMrFomSdNF4tRggU+POttygHzKgZtkDUHmKFY892pWSBgcvm92bnR/pulBBh5t
         ZI7w==
X-Gm-Message-State: AOJu0YwDGVMJWPYniFNDOPbFHp8Zw/ZmVYcHDUNUgGGfrOTDCwDuZZU0
	m4jUFH96b33PwV8euDLiZxK/CRSEb9QYv12TPgObo6Xo/X6qA7J6KNURENRFQoMmtU6sQ8n17W9
	r0y3NrImhk6gTSw/1SYYE+yblTZYi0Dawt5xst+Fe65xRbCt5zYIQJoDEYNW15/obXKeS
X-Gm-Gg: AeBDieseficVnMLG5WJRobLl0I2ESaBvPVytneF5gn+WVxotqifwzo5YPejERvS7+IN
	HE9YpMLq81M3YdSXCU+aiHyArAJefX8L3p6bGDI9KL5bmaMP4jS8bR+T4LLtX17ZWZZ9sfvu7Ip
	Wym1LSPp5Jm3mQMS4Urjr2JjoMlpbRhOwPryLFMyOz3PbybLVi3uEyJ9F4xPwyWbjbj60jGc6Vv
	AE4xKqoVV74R5LrGV7nLLxEPfaHZFOJkpxsIrJY+hrVucQ7J9413VJWRUwRGDxCKlPVPiOsmAFJ
	inDTAu5XEKK1S3hz5TjWXrhYlo0vHnqV3+hGQnNwHPgxqDgqOnN2/nuCjdGmNs4LwSBzH2d2kE9
	QbUH0FhgGt/bE543Tkn8ycbhoCm1p+25bKAVB1pYg2bWCPVY/cvM=
X-Received: by 2002:a05:6a00:181b:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82d0db7e13dmr2833571b3a.30.1775217541344;
        Fri, 03 Apr 2026 04:59:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82d0db7e13dmr2833545b3a.30.1775217540848;
        Fri, 03 Apr 2026 04:59:00 -0700 (PDT)
Received: from [10.92.178.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c747fdsm5780678b3a.50.2026.04.03.04.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 04:59:00 -0700 (PDT)
Message-ID: <3eeeb94d-a8ce-43e2-bdd6-642e36cb277e@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:28:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ufs: core: Configure only active lanes during link
To: Bart Van Assche <bvanassche@acm.org>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        nitin.rawat@oss.qualcomm.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
 <c8ae2a1e-e42a-4591-839d-e22f93ab6b17@acm.org>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <c8ae2a1e-e42a-4591-839d-e22f93ab6b17@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nXzad1VtqgX28SjyBRCONAdOVg6LKtLv
X-Proofpoint-ORIG-GUID: nXzad1VtqgX28SjyBRCONAdOVg6LKtLv
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69cfab85 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8rK0MGtTfqIXTTsz8cQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwNSBTYWx0ZWRfX0A8uf76SleBt
 ZlKJFr60TwgxyBtvVxKKIjXOqbnTvMd+8SSvvPHfKI17pZYEL6ACLsOwcsPzNvVfEyzI2dn7uM2
 rSdrZwnMrzXMFu+5XGHD36W6zITpRhyDSXdxuIN4sNxqlpmWHjIfYva1H9/O7NG0fVr2DOF+U1Y
 JG2pxAPAIr0ONnhfjw4H2houXZiK9mVOVz7VMqKCKdmUNNcBZChVqtGZIvx5MtwVfUiHd0TnOS+
 W8PNkeBvimm7fbOugJPbAxu6gqak12s3GG5xJUcxUvlA5tZdIo/KbtQkHm87AK2oNEIYGmrE0mK
 S3N+95sKHm4aDJ4v80ImlrAAWC6XmZJ8x9n63XLlPjc53IFDMwDC/D+Nbtzzkznhnun5nDsODlq
 KGKXoSoMIHa6SFFfD1dpMJTt3ajwq2YaXtfAmhRd/ne9smIN+VJn0EnIiZZi6ZD4n9hh0TyOw7v
 oRy3H+qf2O5XMVBYIMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101632-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B710393E07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/28/2026 2:47 AM, Bart Van Assche wrote:
> On 3/27/26 2:03 AM, palash.kambar@oss.qualcomm.com wrote:
>> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
>> +{
>> +    int ret = 0;
>> +    int val = 0;
> 
> Both initializers are superfluous. Please remove at least the
> initializer for "ret" since the first statement in this function assigns
> a value to "ret".
> 
>> +    ret = ufshcd_dme_get(hba,
>> +                 UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), &val);
> 
> The formatting of the above statement does not follow the Linux kernel
> coding style. Please format it as follows:
> 
>     ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
>                  &val);
> 
> A possible alternative to formatting code manually is to run something
> like "git clang-format HEAD^" from the command line.
> 
>> +    val = 0;
> 
> This assignment is superfluous, isn't it?
> 
>> +    ret = ufshcd_dme_get(hba,
>> +                 UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), &val);
> 
> Please move the UIC_ARG_MIB() to the previous line.
> 
> Thanks,
> 
> Bart.

Sure Bart, will address these comments.


