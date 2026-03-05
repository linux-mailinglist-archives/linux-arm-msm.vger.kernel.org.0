Return-Path: <linux-arm-msm+bounces-95533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKzOMGE6qWkd3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:10:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C667320D389
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC1B300DDC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6EB366556;
	Thu,  5 Mar 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcGZcqCV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFTYU19A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CD366554
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698103; cv=none; b=Pc2bioSbOmdqdu5P9ClxPdVom+1rdRb0lBWCyBmVz0wwV+LcnABK576O4r9N3E1dSWmn07dB+tG7EtfNVS3sVdVp2YOdnrCCKoTAdifGRceIzQkTnNYDy44SLpG9GXQOLC5PD6yVwiHbZ1Jxu1EBLyGUXGhFIyjuTZ9wZEYqY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698103; c=relaxed/simple;
	bh=0mu40XqlmT9C1K5v14IN1e21NLNB2K/mZDZbVz5wGR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHeLu88sUSEDilmF4nXjKWbxU1bbYcDLG9tCrByu4JzxvuhL/bGJ+Y0+6S+xiaFhhPQAQQuEfsPBjML0gVqs/hCsZAOlBrWFyYEP7O99C9Wsvb+Y9bF4epF2xRhnQS45mYBHsDOFtI8GsIQWubILkzAH9AzEhUif1DZNbj6qzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcGZcqCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFTYU19A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254taub218453
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Tu9sOHON+DSOPBlmrUYoifOv0lkJ+YvIm7FtkVs0cE=; b=CcGZcqCVNrYtQjs8
	WjggGerePfHnvl6pWPGq1HxUOl6y6UnD4PkK14tR6vpCVwFV7ljXqK5xePGJlCSr
	eqJ5AqDrDEd6ScXdgOHfZcmAPViPpUpWA68aa271K15SVZhn5gLdHfyMabqrX0d8
	/1QURoDQHYVFOV9TvbATB04H0In9AaBWHJa5BScUs6iRGkK144zkuTLQy6Q6NtyF
	6N3wOPxo/N4cPsBZBfy7iNFw0MAuQcWn41Vyrm6xtedwB46CXM7QJM1N/hd0xFLI
	iZahZcKlWq6ydFc5eALixxrpZ49EUvdbgwRoGrmevulBC0fWj7FCREOgDLtAWzOP
	UgZTnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380rka1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:08:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463c39so42573745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772698099; x=1773302899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Tu9sOHON+DSOPBlmrUYoifOv0lkJ+YvIm7FtkVs0cE=;
        b=ZFTYU19Az8GdaNP0Yq4c3qvTQ5x9OHhA1/OxEcmJAvJm/rCFB2Xvgtrgb3N9pmx1uS
         4pCw4AL5fVF/z4rNWOq7VLIBf+LVHUaKschhQzEywMIDdxvepqnC44W7nOO0sWZkR3UT
         pB2Bz6I5TABueYs975iD+IE++/+BeIM1G7Rf0D+W1QVNB74govvmKoA4PsN0yAbpf0Jp
         DXxNyrMp2ee6o8knudkuOagr1bMomdwgILXJpxq4sVHAOU6bcAZV6QVoRbcg9chi6uil
         m94r6o6k+FTuMVZcDq0IcUPqqtnD/z/QD8SZETDTNNNz+wK4vYAyIM4AYVXD5D3VW5hD
         Rtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698099; x=1773302899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Tu9sOHON+DSOPBlmrUYoifOv0lkJ+YvIm7FtkVs0cE=;
        b=feE10jCXAlk3eTAtXQtcTlBgoR2ulHgjYwDq+fL934V9DI6r2+dgb9b685wH7Vj5pN
         Pdpv6iVvKGHfcybyW97Hf8tkmff8AKS7xBHJw1CBPcWqXhSEElPoobBu/04iBXpy3+kn
         S9K8vlFsXF8d5udK5TLG75zMqnuWyiuooFsJZ2tICvMmL78MJXGUGcwkadm0+m7odSwx
         n8eTkjqnL3s/PXPQ4CXsj2C4DmIuaTT8y00YmxEiuXgY+lI/xKh/I29ovvGkAfi/21YX
         dhA6PEeLyNRrdruyA39FQpJl0fGH3ns/61Qz8vbVjLFTp7qvDmumZ64r21UWv6DElh0U
         O5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU5P3iANiX6b6FTvGGI+0eCgmXjLMKS55DwCFbiFVBmkDdmUHyI4qyoZeVjAs6k+8jHSCZKDEFJXm1Oq0CC@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoJZgs3jUVKxu9CWQWfFmKTX0ZwBE7j5ptKm3DQsogXrdSVmL
	SrTMy8Co5ksJlcQQxKfhGxRqzgDisbznGamQQbWh4MGw0zl2jRgRfBosnfqGrBuFnwZYMAncBHR
	T3+PsF0bdUha4G8cm+i6S8l4N8bHlYX0ScbEx/NPbvU671p7iiPMIi6NCMEn1gI0Ligxm
X-Gm-Gg: ATEYQzwcDwCuUy/RIIpkDQbtunBL9ntwr0PWt6O/gXWvLgpb1ciGlKy3suwvXsFf/QZ
	GILPh4lvMwJttDFjWl91BY/Km3S0JpX01YYIRLYeSH3yxGSf+o9iZwm+WhLnBi43Dx0ZIMR59A/
	le1DTwYRZEI4/3I6cSuo352MdUbIyWUf5k1L8zn2VPS50KnEdyZ++wx2vJuHbb0/FYXSqcKEfVO
	F/pKdbb3ODLitGurcn6aRO+e6KTnm6ohk1dSvt3MX6RzDomDuGOffXPncUzLQrGhnoxVPELy07T
	fQQbjYwj8c9Uw1UtEk4ZzwNYTSxL3svkQLn2nugGuqs5hFPVrnHMG78dkNu0jZBYUWab553jgtN
	On59k6krNEr927se47bxDd5NWFNKB2H//bBQwT/N12PnqAkBV
X-Received: by 2002:a17:902:f78a:b0:297:cf96:45bd with SMTP id d9443c01a7336-2ae6aa0943fmr49881465ad.19.1772698099279;
        Thu, 05 Mar 2026 00:08:19 -0800 (PST)
X-Received: by 2002:a17:902:f78a:b0:297:cf96:45bd with SMTP id d9443c01a7336-2ae6aa0943fmr49881165ad.19.1772698098846;
        Thu, 05 Mar 2026 00:08:18 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6df578sm220846945ad.81.2026.03.05.00.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:08:18 -0800 (PST)
Message-ID: <30122c93-7447-4f7b-b546-e4dcf80476a0@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 16:08:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a939f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XLcW7MSiMK0kOx3OsRAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _pkd75v7CxBvHkx57ZUYVjTiICgBTcXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2MiBTYWx0ZWRfX0ah6YWpXfGHE
 s2WeCDDQkmbireaBogmcGvPae5RLT9wnvE8crkLaSXYBUv17yNeMxqy8zDkss/Oq0KWtb3JlWnT
 8G088OgU1GWgEKjbyU0eGZOiMmD5M+q9b6fzrtdEjEOHkuJr8tQF0XYSlGITb++OSkVhCKTGJap
 hsBiXVB9qqtI6QB4I3eCePlXrG1wabDRWJrHgPPR1NPruLZjjiT6n3/pAQc2ENZ7zIzPy24tF2v
 K5Z9qSeAFDcwt/wFyFC6IdMcGIg1y9wc49KhUp5goruJvpzSEjwSaQvx7ZSNqXSCyomyxGHqozI
 nJ3wZnn7d8U9dtIRSOdpMu7OvkkAyiq954G1BYJ2Uia4zQDGnDuJ08ocUW2C9QKaPiUhGU62PQE
 3pq8Q0Uf7CAoDUxEN1xtbdVzDV9S/7Uws95jYmm4DeLZWn7+WU2zJx6U2g0O70MLA98pbw+DTBW
 7FStVd57vfbjXdTMYtA==
X-Proofpoint-GUID: _pkd75v7CxBvHkx57ZUYVjTiICgBTcXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050062
X-Rspamd-Queue-Id: C667320D389
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95533-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi

On 1/8/2026 3:43 PM, Shuai Zhang wrote:
> Since USB can disconnect at any time, if it disconnects during
> the BT firmware download, the BT controller firmware version may still
> be updated even without completing the download.
>
> When USB reconnects, the BT host detects the same version as in the
> firmware file, which prevents the firmware from being downloaded again.
>
> Therefore, remove the equality check to ensure that after
> USB reconnection, the BT host can still download the firmware.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/btusb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 646de80c7..991064a25 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>   		    "firmware rome 0x%x build 0x%x",
>   		    rver_rom, rver_patch, ver_rom, ver_patch);
>   
> -	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
> +	/* Allow rampatch if version is greater than or equal to firmware version.
> +	 * Equal versions are acceptable for re-flashing or recovery scenarios.
> +	 */
> +	if (rver_rom != ver_rom || rver_patch < ver_patch) {
>   		bt_dev_err(hdev, "rampatch file version did not match with firmware");
>   		err = -EINVAL;
>   		goto done;


Could you please let me know if there are any updates?

Thanks,
Shuai


