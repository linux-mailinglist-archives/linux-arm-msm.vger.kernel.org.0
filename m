Return-Path: <linux-arm-msm+bounces-111724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h4AkEBt0JmrmWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:49:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BE653B3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:49:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bxyPT2Qv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vr3xxG0C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FFCA30071EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB7231E83B;
	Mon,  8 Jun 2026 07:44:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5738644F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:44:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904642; cv=none; b=Puqo+HEYt7nUa4IqQfF6p0CsGHa5vuYtlAaHS4nfSw/JApAqwO/Q2dHWlgfNKu3fmY2iudP1Pr1WRlz1kmbbGZ0Q9YnJdAEXX6FEO6Hhy4siiejc9u+9c62iAF2hAb1fWSG2BfPb0X+2MA/0MS7KhgXHNh7WNSBm8f+PLP5Xtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904642; c=relaxed/simple;
	bh=PFUHre06+HVUrAuZiI/mIYZTvStr/7Tol6OMle7Doh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOJMO4xRQXW6TGNgoauLihSqbS13B6otTRchqK/AM8DdnwX/aFkXfh81qhFkBwd4pljrLEAS8x+a3GG7upOUrVtgjZFu03EEpy/MfEckffyaCGDpk3cmG+hjpIKEiozQvTOnDr7r2krOLeDimsdR+VipuiMljiYekS2BCzSXVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxyPT2Qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vr3xxG0C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QrYr2771578
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ll9jicp1T8nD2iVAfwGQTwpackBft8jmAmcVwn6yJEI=; b=bxyPT2Qvf1aF34RR
	7mgHLg0xLIrXsp3fDymEKgTA+DE/vVP+Sf7AP+9vN84HHYI5p0A1YZe7g8FT9PD8
	RGWPFecrMcevs7Hi6Re3huKV4QX+KV9LXihysgGu67JEeq7nzgRC+3CtgtPq8QcI
	pi1YOy5YfxZ5mCXSFLm634EG0O+/VUadBkO+3Jcpleu8F2OVdbeaQW8y0z5StCo1
	nbv3V/S4Lv/Qcfky3aZwQjBnlkL1k3LdjYUMKRl7Xr4s7tXMdMy5y2M7yrkKX4L/
	0STpFPRmeHwJxNKNvjHvrvTTPv/aOZ+4d0XVFdFS294I2FWwBQBa+/CrQBdDFwnx
	VAPS5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6egpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:43:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so32340385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904639; x=1781509439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ll9jicp1T8nD2iVAfwGQTwpackBft8jmAmcVwn6yJEI=;
        b=Vr3xxG0CfSfUPjuM57t2NW8xaAAUtaFrbxG6UksXJ15LJ99TxSDttZn3/ke9xOhU6l
         M9P8NSjHhrfHxOUV066dJ8w1fvoLlQBUxiWNX3RIqirSe9k3KovmJ45FDFeYZ1mAhkw2
         jGRTeAznon/+PEPd15xZT0GtdIoC2iHa4S4xXjWtYU0vEH/Kiuvv7AQevk+13m8RGBSV
         cjr3QL1fQ1l+xATXMYfZOPJJvbKcFU5r2zriEzLffIOXBBe76C947UuBONXkmen9vHQL
         vpgdmAdBO14PmyH/IoPsrZZmYIf/VdcBkRiHeXrJcY64WcXP5yAKCv2vPFK8kpxTGXyP
         U4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904639; x=1781509439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll9jicp1T8nD2iVAfwGQTwpackBft8jmAmcVwn6yJEI=;
        b=Oco79OWbXIF+oG4f/WkBVCzqOaqxImbxttn/bGlcA7r7HU2hAHlVAtmlJInsqvquyM
         TLCIIz6PCbKiodsfAahTIcWOvARzYdaHxOsoFW5WCyQdn9TxpvJccisgf4Yu3rBA8YD/
         4Evw/1PiESMCbnP3dPm81vidxCQvS+tWNMCYEsEmvYLDq0Lb9K82c1KKlmobMe10o0ff
         C1OqnTmPKnreuK0ykrMeE54hMVYQ7IT/9pCUjMOLeNVrxg8R35HskK4iVI/IaBDeV4jt
         G1/1iWZCri3FtwmI1v2BsIePkUqeif48Vknu49Tv74fdgMdbmehepPUA12KQKl18/O2H
         QZaA==
X-Gm-Message-State: AOJu0Ywpb7rhrsu43I12dW0q1MfwniVOQD0rXuf6ik8m8JJFjTLvwzsS
	8jbuKdpBxLkDpzmIC3FRkkR5Szq2eUkMFoMJxW4XO2ZCtQnccEDL7r/kPdbnNOk3ovDbcY8DoY+
	aAAoxRHdSBBH7N+KaHw44gjJLd5Bk4hMcF8f1HV3x22+tPeXseRdJfAjcqEMYtzrJIktb3wer3g
	4d
X-Gm-Gg: Acq92OENlokXiA0VeWW8EfMjcALX4oM1UTXbfgSPJuYOwPpWbwwRt9JSlIbQuZRQC4/
	l4Q20feI1wRUDKKipP4J8WjSBPzjbnpGq0taydhjk10jypvb+NBNj+UVKrNtgHIry8R4hGhPgeK
	+tAO2PURhzKxlADsiIvFo1szanr0gEuD6Bs8U1lAvL9jeut+jPLo8AzFsGGpndrklTtTvnURCHX
	FvnMIPkixumoLNeyQRudNTx0L7j6M0rs81W7/ql/0h85OMVsusaarAESDS8ZDAHHXqwuGRJWGiB
	9cO0K9wLUbp9aByVPMi8hwB8ctf8mzk3fhEYBk7dkoB+yMjMpi/Zh6WSGSTJdqZerLxpm9cTj6s
	OcUc1dvyQYEyx5dEMTzP17t1+jYcYenOtXWikn/uU+Xt1FuZjP2bOsJf5
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1387110485a.4.1780904639208;
        Mon, 08 Jun 2026 00:43:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1387108385a.4.1780904638766;
        Mon, 08 Jun 2026 00:43:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f1bbsm6686090a12.2.2026.06.08.00.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:43:58 -0700 (PDT)
Message-ID: <d494a62a-2d4b-4406-99f8-cf8775ea4706@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] drm/msm/dp: move the pixel clock control to its
 own API
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
 <20260602-dp_mstclean-v6-7-2c17ff40a9b2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-7-2c17ff40a9b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2672bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YadZbbKFZxuD_lQ-BoMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfXx3mf9LMqj/96
 SNc+4Ut1yTO9bgXs7pYAZfdfl/5HwK9xldpppnJMwdBUZ58zdOND1Ci4MXsj6RP+HCMfQS/fSBP
 YBNzrOa2eYCIA0B9DxvXKsfqWUb3FnfRB5ebD5EdYgvL4oJAwNvxllq0BDfs02jx5ijGau0byNY
 l70HCT9mCyLVmu2yIE3UMlp6l3kIM9XRbtCcFRxSHPUf9xWsJZyWif5f3q+6bWM18oGofNMRbcu
 30lP41hWiSVkawHUH4Af5enFjYA5l/FRANOteZ86VhRIAX9dvST4FpxjwS8WIntPdBgHHuS/oXH
 hSXLtdZIuLsGlhTiOon1rb29wSkX/O8UU2P5gQ6WvSvXFbAjTGNRYnQO35O7x9yl+qbo0TO0Ear
 L2H5j+hwRjbpW1jTxG5Ci0wCE3I5XYj7NX7PNBbksIlAFFT522Sys9bBCaoDFSZKzEbr25nV/24
 7bK0uJcFZfEtVdy1Zcw==
X-Proofpoint-GUID: PX27pgq5JK3uwNdm3a-35fT9NZZ_c4rL
X-Proofpoint-ORIG-GUID: PX27pgq5JK3uwNdm3a-35fT9NZZ_c4rL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-111724-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C9BE653B3A

On 6/2/26 11:11 AM, Yongxing Mou wrote:
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 81 +++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1c2eccec6ec6..ac0a2c387f03 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2171,6 +2171,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctrl->stream_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");

if (WARN_ON_ONCE(ctrl->stream_clks_on))
	return 0;

?

Konrad

