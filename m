Return-Path: <linux-arm-msm+bounces-93858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGekDGcSnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:52:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52718122F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D30FB30D639B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD8F273D8F;
	Tue, 24 Feb 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igbFCKoz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2nVNYry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3A1E5207
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901524; cv=none; b=HCiCe02YxI4xzkr/QfXBPf7aRm5FB4OvGI2SI4KbyPdoaVOEZ9+6s8nq008cJT+GzpeRrGn/KJRGXjQ5xQhImhwWVnzCzAU11u/hwAxN2gUhT7bkF6NoQW7OngxPMKMLb3cuaE6ufc8C5DANiihfwTwoMuG9GhORh2nRRmzcxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901524; c=relaxed/simple;
	bh=EG7Zem76rcri1wmu6SzU9bpWgufomZXMfyl8Nj9lbdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prTH/pg7QHpDb2CLFRVW4OuEWlynZN6DkVQpd9Nd1fW8R+5y9/IxzDYhvepmCkSnDVGttwoh8FcZaVmNFd8CW+s43ZOlcgjTBA8hN06Oz4RvTKijP1h1URTmV4IMMQR+5IBk8XZspGPdYVlOzthQxMYQ047MjVn7a257ZCq+7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igbFCKoz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2nVNYry; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2m7Iq1265702
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=; b=igbFCKoz30Xci/cW
	bs/R2HNQ+IwXCJIpslVh16nsZ9+x69s3ZxaZY0CefdA/DEQdy6CaSYwpBM+xObYd
	f/VCn2owWQYvK/4L6FqN1esG+O5YZjC44PXNAHY8cFNJygAZDZNCqlVFbKAgv7AA
	455tdyxyzBx9GJmvR4B5vbEQNmJyaFRZlNsi1P4yVZdLVbu8bcZRo5HkQRoVBo7l
	l1Pd4KKj6BJoEXwoRv7OcYPuyqtTRfA8kMkaVNrkyc36fr4R5MpmmJ3QPBOXL2if
	LQVEcCdv1t9Tj2bvLdzmPTmJ6a+rQsBDaYGC9tgLRnU5+stB2b1G6QSs2f5lySO9
	9QxzbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ttn4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:52:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7a98ba326so74840105ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901521; x=1772506321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=;
        b=V2nVNYry3ruuJUme9EIy+E5Li0oxlaXpmca6YtIq/mfeuTMzNyEHPva9no7l8ZSnYy
         ZK8o7DmtCAoONilxRAgw6V+P0LEPgXA5jpktRqKAxipTzKY6O/3z76nIvIysXTszOSvd
         DMMDUbLxKUq7VMQdDg3SehPhWoRu6Imhxh6CkShNh1LWg3xDAj0+BO4BmHMA7T4mefiK
         3Bq6HZFNKPK1cLPVoIg6nMMJDqBDZgXQeSBIDQR2PiRQtMVcZciu2uX2lVNP2yaSYFQc
         nCVHvFbCPaotdgOZpFw6XpDJMplWQr/aRZvUbkHXZfKG2DwP0J7jDLswffCOVW0W4O8J
         /H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901521; x=1772506321;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMJp2dBVtqdUWCHncCX+tIj1sCsocWtenX7q64eQopk=;
        b=Ei9PLNOqtrS85Ncsmara8btMahZCUDjfKbYYCp08XpPUOpvkJYDqy9+QH00tVQmPl3
         rN/CFLdZ9hUQqp4M9kSgHfyOtdvxNeWQ12eYL9eI/3+zPloBBVZVsuYhh8XyHFYTKGZ+
         ud5S2pFllbdxp4zk5VnS1DVtLo2M97WypRD2NzZ7xsWJdvgGu5WNfODHy+0Yn0mBghP4
         TQu6E49/NQPeSkwqcS+REenza9exIGZDF1vXDmbUpIFz8Ox6kYN6pqCERNKp/LVZyJHW
         RbJyx7idEg9h//TMGlyi6RDwK24ehfZ8f9CdHpsXn434S07J581xm9evowZRJvJy/wcm
         iS8Q==
X-Gm-Message-State: AOJu0YyL8cEvflhRPwEWZ4dyqmJ1/nbvDs6nAHUdBtM+KI90sRui34Vj
	szQgbttLXlYFbRy0Iy7ZlM6ASDVPlYISy3t/HSFBBvEwo3Ll/FoB7X03BiE2aAUf+1VB4wOayj8
	XX2ydMglxE8W3G2nxW73GKlSjVYJGlTz20GBCaGAiEhlv4IrUjVDE2GwvZbYizq4MYcfm
X-Gm-Gg: ATEYQzyzJg22OF9yTRkUckv66UjM6CGtVNB0loWjmMERIRjKD9l8/garmo5Yk4mJcx4
	vchlhHSQNV4sfm7M/k0Am5u5eFH/LyxamqasLs68iqoJFJ19ILuuQ+lNixALqSVU3bIYdek4OG4
	0NEWZbAF6o86m5ounYQ+qtOJ6pwFmgWMhGjWVMufVey26/yHfD3+EnapMpnMz5AVgnTuOfXEkQv
	CxnVyx4+EexeLEW+Z7E5SXUweLbuK4wOuopfQV4WtXspLShBDDPtWRSa9s59kuqNCiVvoe9DS4a
	Bwq4pbnX8WZEX3Dq/W6WBKIULE6h+bMswEwDdqlhCWqox+Jl0i0Am3HwZELX2K1Drc0idrOhdlJ
	g+GbPLINB1NilBEFoJbLfnwAbErZx9dDj5pOs8YxEb/J6gfnHZFkkVOlEf8t0PrHcfsOrj2D+OK
	hFibPChKcmIP/jP9u2Po4=
X-Received: by 2002:a17:903:2f8f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2ad5f7b89c5mr131753955ad.26.1771901520713;
        Mon, 23 Feb 2026 18:52:00 -0800 (PST)
X-Received: by 2002:a17:903:2f8f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2ad5f7b89c5mr131753765ad.26.1771901520083;
        Mon, 23 Feb 2026 18:52:00 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dd7asm118909235ad.28.2026.02.23.18.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 18:51:59 -0800 (PST)
Message-ID: <8280b524-4e5b-45c9-ade4-337c3e86e936@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 10:51:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699d1251 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zcgs_DnFwR7u2ldiTvIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6pkNBRXn0iU2tGer3zkh4cGS7NTfKAer
X-Proofpoint-GUID: 6pkNBRXn0iU2tGer3zkh4cGS7NTfKAer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfXz5tyyI3Mlw6e
 eqoUey+H3rf+eYuXVYlcY3CSL4y8B5pImzcgT9XPdmeaeP4lVcR/95yDWnmYbII3dZgVXjHf2u0
 c4jpNhW0PMj35+MCPz9mVrziBo2435WiwP3Pm+HTnG34e8NqOu6tpAyGxSicRt5ts3mm8o6l4U3
 CE1fbQATnPav8jfPoybMAdVrNjeCvYd6vra3/DRr8/mAglgErPQrj08qb1Vi72A0xWYf5qPJKa8
 lSpxMaHWz9rAV+ITyLNRBbNF9faTs2/rfWlScQAFo+sWiBxsGUXhY/3onS9gjtDbT8TVs3JkCgo
 q1fvUSbMh+U+l/FB7y68E614gGHAK67hSSTlnBbscH+k4WVjrsRiDf1s9LexvRhGPqtbGDslnqm
 9o52eebSmhIbV1EEhefA/Q1NGFHmbPXmo5Ve08D1EzCxpNKBBbFrY9pmOVe7S9pLgHK+xIqlakf
 LuKY3Pi9MVpL+q81T/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-93858-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baochen.qiang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F52718122F
X-Rspamd-Action: no action



On 2/12/2026 10:52 PM, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>  	}
>  
>  	prproc = rproc_get_by_phandle(rproc_phandle);
> -	if (!prproc) {
> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!prproc)
> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
>  	ab_ahb->tgt_rproc = prproc;
>  
>  	return 0;
> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>  	ath11k_ahb_init_qmi_ce_config(ab);
>  
>  	ret = ath11k_core_get_rproc(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
> +	if (ret)
>  		goto err_ce_free;
> -	}
>  
>  	ret = ath11k_core_init(ab);
>  	if (ret) {
> 
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d
> 
> Best regards,

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


