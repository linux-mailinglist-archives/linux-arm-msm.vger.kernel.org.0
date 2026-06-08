Return-Path: <linux-arm-msm+bounces-111780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9PBI06NJmp/YgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAE654A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="h/FSNtbJ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FGscSEv8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9B43009FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8F3368BD;
	Mon,  8 Jun 2026 09:33:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B2350D7F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911188; cv=none; b=N07CmJNTcjsqOdP4JmsqZAzQ64rE/ebUHuSSlHWTcc8XvtkpS+dDIDl2wrfGnao9wEPqR90FmPbQuxjYM4WBdyuKZds8NtFh/14jJlNx7p8nme0qH5nzsVOL0KS5X90Noe6tmpQZlyVo7fGCOPszteHeZCnvNe7/7qz/S6b2U1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911188; c=relaxed/simple;
	bh=2mKuoNeczjYmLgNRJsQsMc3RGm1bt+Gt8+Odq/otNCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knzgxgdx/baSBlRfZTlw2wGKTKXYeGQytO/kiMeGN8o0ROulcsQp763sFHmCBipp6dHUqdCBrUng/vEEF7WJ4liDgjdk8pxLIvR0LctHT35+33PNkkEVMoKI6dJ/tZAQf2NpaoUQWm36sq6a0+JS9qOv9eKzkGxgW8poZF0TRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/FSNtbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGscSEv8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ouux2832965
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZtl15ww4PXc5flceKtv+LPJ3x3xJtHYHA2F+jHkfLs=; b=h/FSNtbJsjoVXbt3
	Dzkg8y6u7GxupvGXgs6sS15rhtrQ0p+i5A5xECXxovdmyBJ7wM7Mt3PssJUTDBd+
	oKlhiMTLfRtoDJ+aH8hikFv/vSrYGv2bXmHtUoPrehanPTGRURwM9VTIWkatXphQ
	o0pjmL/OxuTKvGGBHZVgoIaa6/azJVPYX5oKg5yDQSVEZUMozGJdiPkMO2mnDZja
	DACEu20q+2LIodR+KJmVY27DtY3s2az4ifNYtUbqUSFtCDqZGwhSte3QfOrv5PY0
	Sa7XHgbYuRbK7Dw3lOa8UMRYHU+PDAFv8o+pwe8Ra7Q8+j+K4Pmi20LD0ZvGOuYl
	VYyHyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrf626-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:33:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so11643441cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911186; x=1781515986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZtl15ww4PXc5flceKtv+LPJ3x3xJtHYHA2F+jHkfLs=;
        b=FGscSEv8H22tjO+kkZH1qKapc2mgkhFgP0Co0YwXLiIC69JD71o2kCy/ua9p4sZegy
         SMHmbNhLJi87/Jpzu6zp74Cu24WxVgkK8mr6QW3xIEV4WQ853VRwJM+TkMlV4ZvuFIBT
         3z6ibdL7WIZ9+F8AluOyprZHjnzFN+eHfPrgXVdxZaPvX01fsuNrqv9IpR0u0RaK0XG7
         xno3PYsfendRlyy4WVvgKRTJiZI2x2VzPjjgZo6llxfO8eyhT9dtMMsuOYV/W53N4BVb
         WdPLDdFRRI5zJ046uiSvyGr8uvKu9pCaOzdLAMirXesyc8BabV3FHibNmOPbeqJnDHHD
         YcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911186; x=1781515986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZtl15ww4PXc5flceKtv+LPJ3x3xJtHYHA2F+jHkfLs=;
        b=rBf9vw4i9mj2PIUeEyi6huJBoEppwGxzBRGn4eNhpRa1fVDpabu18n+n+aZNMpn2Ef
         pXZjoGUXCTzy+yHdKl6i6r2KfAhmOF+pItnesQE4DAlyAQmjXZ4Tk/67dUa2rVMmCjG8
         cHWN3kO2cF0DNfmOZFi47o7V/tEc0ZCVwrMP8vJISIZB0emo1WHtWUwuMszmUOTIIjWQ
         c0q4KmGeKuijdF64R8thwgjBhNEdaodV5/6TiZmcU4rsAv4cf52GBklhTG5egzGlOU3Z
         ocff3lCQbmSR91ha5h0TFwEz0Xolmi46Qcvj7Mo3zwV6cJ90kXz9ZG2g6zNw14TKDpWE
         Vt2w==
X-Forwarded-Encrypted: i=1; AFNElJ/xz5jfyXT5xnn8BtVutU5xESmtrLBoZZlEpeCJDc6DQONpgWuW9CVtJVlmaPhzi+S3Z2hRadt89b1gxH8d@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mgcKQBO3MwZwM38M5RdciNmskda6dQlLHUbVTcuSdWTT6Tih
	NZfOJvzj7lie9H/VLl5Z5EzYueIGWFN9vcYf02jAXPX2zC6H6zAvtjzhaDR8gtuL0EocBKVpCyc
	D28hSwixHeS4hMVNgvnRFRUZLGppjNr8iej0M9/rtLcylSpIYbOJSwLcKc5ti3wg7mksd
X-Gm-Gg: Acq92OFhmhzHm/yc5NViFEI6L9h8bkfc67Cwvj8MtISNMsvNzmAlxRbTLOcVwulwPVN
	42nlnv7T/xtcYPY9U0HSRnWWQLEU7v22+lezHJQ067F4RHkLKdHNAVnhkRko/K4PenLEnW4VSSF
	VX/7e1XWZB9khx+XrPE3zaVJ6m+s3rjfBmOmtbZ0VaBRtKfK4dxpguAmUI5ztqeL8AOPQ/lGkZx
	feMsgduopLXUguHCU+yzoslXw/7qc3LG1/xzDevFMzQ9IgLsOZh/SDfuiAQZAdr4K7VFoWnczZ1
	Li7+/CtRfveM975BMevN/d8v3G81r35fDu3A9e8eTCT/Q9bMVNIMemCfR0neL9qon8KSlWNexLI
	A6n/C7W0wqH+WlZvVVRx4VnuuQno89JrXqnaSdukH+gCwAE49eqRXcpkH
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125040511cf.0.1780911185730;
        Mon, 08 Jun 2026 02:33:05 -0700 (PDT)
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125040321cf.0.1780911185313;
        Mon, 08 Jun 2026 02:33:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd07sm852062466b.1.2026.06.08.02.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:33:04 -0700 (PDT)
Message-ID: <c7036b15-853b-445c-87ae-f9ff06ede326@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] scsi: ufs: core: Add
 UFSHCD_QUIRK_SKIP_DEVICE_RESET quirk
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
 <20260531235011.1052706-2-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260531235011.1052706-2-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OCBTYWx0ZWRfX5O/QY4RE9p8h
 XsV7a12qc0K24LweC5JUNgNBETT1hILIQuDVVeoprEWsDtn+jBhp1KpJDrgn2RyJHsr5cGpgJ1M
 cD+AfgJwwEOp7vgCsAN6jeN3ByDyqxW+VIFAdtoQaZ+GKimxcSSq+aEJb9kkSEAuUrdMYEZOeGS
 D3rLg9EyjXQ171IuvsNcb8V9Ebkt2RjKfvM6Tx1Opd1efwklHJfRj3BRzk+TVKx0cUqP2CreNwT
 FVg2XuU8SnGVpEKddXWnPqkKuIAvAymF8ihAUszKtlQPaHH+09GSp+cuQDZgvIiKi/Hg8QHbJ+1
 vEmEbRCulINyeI7fgXACGAYHBO6Asto/XQkw7ix9J2vBNeR2bE0SoAAea37GTX7LAf+w/1j7VE2
 HHIIjAttgrgZH7yH6AxYsj8nmvWNP3zI79czBRfVJhB+cODEDoBeilD2VxxB57mLareP3i2OUuX
 4kUtzXgUxQ2+N4o8jOA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a268c52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Am--5WPmF5lAGn9LL3QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8UIVaP84XI1nie8OxXlJOaNQv7gqXS4U
X-Proofpoint-ORIG-GUID: 8UIVaP84XI1nie8OxXlJOaNQv7gqXS4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nitin.rawat@oss.qualcomm.com,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:bvanassche@acm.org,m:martin.petersen@oracle.com,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCEAE654A55

On 6/1/26 1:50 AM, Nitin Rawat wrote:
> Add a new host quirk UFSHCD_QUIRK_SKIP_DEVICE_RESET to allow host
> controller drivers to skip asserting device reset during UFS power
> down.
> 
> When RST_N is asserted, the UFS device firmware wakes up and executes
> its internal reset routine. This routine initializes multiple hardware
> blocks and causing the device to draw a large curreny during this time.
> If the power rail transitions to LPM (Low Power Mode) while the device
> is still drawing this elevated current, it may trigger an
> OCP (Over Current Protection) fault in the regulator.
> 
> For some UFS devices (e.g., Micron), the elevated current draw persists
> until the reset line is deasserted, making a fixed delay insufficient
> to prevent OCP. This quirk allows such devices to skip device reset
> during UFS power down. The device reset will instead be asserted as
> part of the platform shutdown sequence.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>  include/ufs/ufshcd.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 3eaae082329c..18d634499ce5 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -813,6 +813,20 @@ enum ufshcd_quirks {
>  	 * allowed by M-PHY spec ver 6.0.
>  	 */
>  	UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3	= 1 << 28,
> +
> +	/*
> +	 * Some UFS devices keep drawing larger current after reset is
> +	 * asserted until it is deasserted. Asserting device reset
> +	 * during UFS power down causes the device firmware to wake up and
> +	 * execute its reset routine, drawing current beyond the permissible
> +	 * limit for low-power mode (LPM). This may trigger an OCP fault on

Is that UFS-LPM, or Qualcomm-regulator-LPM?

Konrad


> +	 * the regulator supplying power to UFS.
> +	 *
> +	 * Enable this quirk to skip asserting device reset during UFS power
> +	 * down. This is handled only in shutdown; the device reset will be
> +	 * asserted as part of the platform shutdown sequence.
> +	 */
> +	UFSHCD_QUIRK_SKIP_DEVICE_RESET			= 1 << 29,
>  };
> 
>  enum ufshcd_caps {
> --
> 2.34.1
> 
> 

