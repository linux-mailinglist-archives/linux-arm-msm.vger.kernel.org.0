Return-Path: <linux-arm-msm+bounces-108390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJZeL3kVDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:47:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 638245795F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A03D1302F9E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23E03DC4BC;
	Tue, 19 May 2026 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvzUVnQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxjR+Rs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7047A35E937
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176805; cv=none; b=JvU/MbUStWgG2jNTxntp38HNsoCu7QWmg2F/Hp+87RJOFfS5rLYbdn8AO8aQUr2/0KWT1dE7wu0XaT2EZVaS6HD6WfYLdkqtWgk+ZzMb6BbPiQgybdrD9phvBNNSF7Nf2Rj1/yU9c8JWe028C3zx6V52SodwTen6H8FjHGZg/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176805; c=relaxed/simple;
	bh=DBcUa/iGK5mLjNaXN4H6KC01zYnnC4QFPse0rwBdBds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz4KoJLBji4EIO6cBghaHDwjuALWf2K1oilcTdBwQEnfnp0gyyiezVQj3JxgIDocC5vpEHNy+QbcKu20EmB++28vIOZWnV8fGVohrSBAP0qOJTSKbqIzRZe8gcwsRoHeEM8A9G7Cz6NU866dMtno38QnfMRU+yklzYPJ/p8+bSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvzUVnQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxjR+Rs2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J68BKE2437958
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3Ktydrxz2XY64OjZbaLiYF5XalxcbVEevSUnzyHj3c=; b=RvzUVnQQSENSFGGj
	Si3ojI0ppIXc7v9diNm4HpSes+8oXDv1hfEFv25MLDKFFSm8j9E3vXFjPHDpk0Ox
	tKUge0RcMXILXR3UhkByiPyiU+5aLQqhe3ITWdZIfQstkw9wlNF6akETOVQ5/vND
	sLhoF5C/BF0fnMNa9ALJmcTkaBJtoAyDYUfuL4oF8tDeyw6GFYJKuHlv2Xa56GxY
	2v7EnKeIH9bRMg+Uy1Pu7wkbhpyNdWxZ7X6za2lCPhKYP5FU/Qjv9AFjVwbBKpzH
	PItYx88ogM1w9BuhKz9BMm7yDi2okItYS5AeapfLQtJyD9jVhlgih+CxrSOqMxz9
	jqwVxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3tg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:46:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso34521995ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779176803; x=1779781603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3Ktydrxz2XY64OjZbaLiYF5XalxcbVEevSUnzyHj3c=;
        b=TxjR+Rs2K1dEr4LmvNkEXIWf/XWGTHakvykW6soW/Qi4pocekwKq3AUh9JF/qSQxGp
         XXTxskmcBzuHza5FpnNECRCUGB0pYojxz6FS38kbF2J788FOwz9y4fgvz2Ho8OQ6S3AZ
         hMK/nel3n0rZHkwnfMYwcmlLjoYefNyLe2R6doKWI06kzND9LfYK1KiZEQmOdNtuaoy/
         io3Kv7UctVS6Dlse3vX4J90EmlVRygj0Pfn3ur/k9OH+CqMo/hFn9nIQ4ic+Dd0cIj2G
         3d+Yf7VbjQHGEoidIw23CM3MFRt27ap9vp32iEhjlWsL+XIwAkOQcycuyvO8Lu5mu3hc
         L3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176803; x=1779781603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3Ktydrxz2XY64OjZbaLiYF5XalxcbVEevSUnzyHj3c=;
        b=NvLJ4dVHteCuldYh2+gMNXBfsA06KdaCF/iPGUlp7mr0i8E3A8Hb+QMKJxN5HD4KTX
         rhUXf3TJnFZKCkWqdHi65QSQ6Sl4M0deS8jLGhCbqifUSWAZHDVGVVlgZUCwq8lJnw3d
         YHFFdNWKtqkPpo+0MG2hZ+AWK0n3biUYbbSdUcM6S4Aq4JNMp4FIgMC3jAg8dX1CcDBM
         QexgruiGmn9sL8NydT9lwxCnzutQRJMzZ4/HGYSOOabqz6nSysyCvPii/Xp/PDG5U2Cn
         z7UNYKkIqeZ0O3EW+c9PKH5aAR8SG4Fn/VjYZyXLm+YsifTqE8qKecmlGWPsOKgFWACw
         5zHg==
X-Forwarded-Encrypted: i=1; AFNElJ8eeV1b2vTElpFYVcHNI2a2O1F0wuxlQjQ23+8Ay8T3T5vcDhsimtZDysSaRdvgOYQ9lwXet+DWsNeXdxg7@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfoFOP3VojySJyNV/tX5hINAmE8YRTJjAB9//frGUq7NpmYNz
	5ol56uTE4mcAuOGtoO2oKFI+jkGG+1EKhm7x+784XzAhJqcznIf2LtECYMGgoA/Mrcmzr59XT4g
	e6x4HfOuzLWh8GoH5xsxdYoFBGekJK8JmJ6q0RWDtAhoQSQeav6TfD3kvWchETNCX6Wes
X-Gm-Gg: Acq92OFKzhG7Wf+RvcrD+wn0EeRPiiOQazrU2eY97do8M+CWu6kGU9EzFDttPWeK1mH
	jAxlG+LIm5YJusGlsipXOx5CdwztbI0MUKTHcn2LpXvlWcHPPxL9g0meBoVWNokoXAQGyearKuT
	903RnSlWwHeZMkfqrMM8RvAaGqFpA20XK/jc4EtPKuTLu1pndgSwpcd54/P9Cgml9+ntN21lHZD
	LKdTPm9mIqayx3Bcm/UUS/qJlprbj2FLMs2+tTKZG/8eqHYB9k/Wsq5ffHhZCR+SYIkXF/59sfN
	XGOFWHSlgDV/Y4c0qs01wqUjblN9EU5V5/p+GJJYmoslxuJmHFexOiOFZk1JHv0jwko9dI1cnLl
	yOHPJw6zw/Pvloo5DN8QcYC7Xy0U/9D0uhs1tLpyFoxUjxsYNgpuStm3EAsPh57GMD1lqpwUWvf
	AdCpJAcR7Oe7WXbivn9A==
X-Received: by 2002:a17:903:2410:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bd7e88f047mr200097895ad.22.1779176802773;
        Tue, 19 May 2026 00:46:42 -0700 (PDT)
X-Received: by 2002:a17:903:2410:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bd7e88f047mr200097455ad.22.1779176802305;
        Tue, 19 May 2026 00:46:42 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm164839885ad.30.2026.05.19.00.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:46:41 -0700 (PDT)
Message-ID: <57f574d3-7000-42c8-a5b7-88f1a73efd50@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:46:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
 <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c1563 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=POr7qE6iPcSwGRG4OQYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3tkNzdG6tXd4Q1sVO0dKkUuPrXWwYTSz
X-Proofpoint-GUID: 3tkNzdG6tXd4Q1sVO0dKkUuPrXWwYTSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3NiBTYWx0ZWRfXzbocj36XIqSj
 aod/eslDBvfBl9ni7gDL6MbOC/yPFTOVBiKRgJHhPNPbqB4pOsAHqD/2dtmCgpmT3Ar+BuLwNMK
 +bqpBPP2jWalLUqUSqwuOJZcuzXxXjQo/q1YwivHU+QKlAfFnH7nJSSgb3dm8TSp++ozzTuh7fz
 EWgpyddOQZ09lfb99pHQJxnYM2aX6VbSmylaxYgB3NP4WBL1qS5KA+nlVkj6yripX6FtX3DoB1q
 gdWfHQL3bXDtKcfTE1uq26rsKg4YK4fKeAp+36mczIchMgkVAWYA8l+GazMiatyWQxU6CgFMbHC
 qIKDyS2fgk8fhimYK7YuQliE+rsaiNwLQO9HCjlYWUdJNeaJxNcsDKwajsvpTugKm2jOoiIIs09
 wFJKNvLlh6jjKXULV5XXd9CNX9mDEpp11jNG+mVPBcluMJAhB0x1Wqc22T8L0ZLU/UM5b52gBFi
 ursDO3SjDgnXjDaSlBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108390-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 638245795F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 1:34 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:40PM +0800, Yongxing Mou wrote:
>> The DP_CONFIGURATION_CTRL register contains both link-level and
>> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
>> all of them together. Separates the configuration into link parts and
>> streams part for support MST.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
>>   1 file changed, 28 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 476346e3ac19..85315467b5d0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>>   }
>>   
>> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>> +					    struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 config = 0, tbd;
>> +
>> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>> +
>> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> +
>> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>> +					      msm_dp_panel->msm_dp_mode.bpp);
>> +
>> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>> +
>> +	if (msm_dp_panel->psr_cap.version)
>> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>> +
>> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> 
> You have an RMW cycle here. Please document what prevents it from racing
> with the concurrent msm_dp_ctrl_config_ctrl_link().
> 
Here protected by mst_lock in MST case. Will add a comment.
>> +}
>> +
>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>> +{
>> +	u32 config = 0;
>>   	const u8 *dpcd = ctrl->panel->dpcd;
>>   
>>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>   
>> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> -
>>   	/* Scrambler reset enable */
>>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>>   		config |= DP_CONFIGURATION_CTRL_ASSR;
>>   
>> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>> -			ctrl->panel->msm_dp_mode.bpp);
>> -
>> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>> -
>>   	/* Num of Lanes */
>>   	config |= ((ctrl->link->link_params.num_lanes - 1)
>>   			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
>> @@ -421,10 +436,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>   	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>>   	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>>   
>> -	if (ctrl->panel->psr_cap.version)
>> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>> -
>> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
>> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>   }
>> @@ -450,7 +462,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>>   	msm_dp_ctrl_lane_mapping(ctrl);
>>   	msm_dp_setup_peripheral_flush(ctrl);
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>>   
>>   	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>>   	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>> @@ -1628,7 +1641,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>   	u8 assr;
>>   	struct msm_dp_link_info link_info = {0};
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>>   
>>   	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>>   	link_info.rate = ctrl->link->link_params.rate;
>>
>> -- 
>> 2.43.0
>>
> 


