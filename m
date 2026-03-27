Return-Path: <linux-arm-msm+bounces-100429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPCrJG7fxmm5PgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AB34A71C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0DB3020035
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F26385511;
	Fri, 27 Mar 2026 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggNdGbRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcK+ySb6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB5387572
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640535; cv=none; b=i6kLyugdOvUtqTLOg27bRP010XMfmWx7Q7a3X+vcGh2MtVLzJXMgh0tJgGIs5k8XPPi8ntFPjJbL/FUVKa8ZRnOsd3YVltSd3/v1PxROyqwRA6dXTwLsO410KjLeFjJFQFJFhsKpc3xY9D1myR30wWBiV0SvSp2IAP9RGtdTsog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640535; c=relaxed/simple;
	bh=PNW7g+ERtlr+2hptPuc2KYeIiOb+IUYxiF0ScmFkMOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xscoz4V1IoLb5yD71RL012NYHL4UnVZwVKKbFg1SHkUNFdN7gKtF2U4yEKXDbQIDiC6wdAxJv1nAxLCjfvJu/I+E/imdospnCD3cPjVIQ/eC+y9nUGUhW+QHyOrfs0+ip376TH0zkFwSlNgxRiPZjwYjeavqMWDZ49uutdCpdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggNdGbRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcK+ySb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2dP63137173
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbhnR2aHPiZPhzlyeNXiBA5tvmfsHM3QRYGntWNCKiw=; b=ggNdGbRplv4IKHb+
	MMrfRDPPRfobV6tjaUGjD8IeAqyxMnSceY4FsiRhzdLteOICvIcaBrkGRVKasXxK
	9UF9E95aFfm1D9kZHEUdGSA+rA9hPsrzQGawfIQg6ZmxADR4uiTNuoz5QG/ZQRfR
	JHVY/BIn40cSMCYMrzqrHXK1VOYdx/iOXXw2FB8QVZnGaDNJwEcb41lhRquXrPC+
	MoB7Mo40DTLPYguGvaZLaLVDKGOyu/PzOY7FvYN1sGY0VH97n3tKMUruD/HM2llV
	JIGdjoZlRCY5VghhyQq9pomkEA1RvVX/3eyXm7hzUK/5aYmJKjdELymTSSWAa6uf
	QVS40A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1cymx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:42:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so56609441cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640529; x=1775245329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbhnR2aHPiZPhzlyeNXiBA5tvmfsHM3QRYGntWNCKiw=;
        b=QcK+ySb6tu3tx2D/01T+Kk8NUijlS3j48B2ViFlO6mUTGpZtyFLBKH1X2J75tLaqBN
         aqEBNjzt/BgYuhUsAjdUGWjcMUzRwlS/fv4ptgyqoEtNt97yXHKhVXp4R6XlJ5lyO0sW
         uzvSmhBaaeieVX5Gekyckmn+AxTpkhDMz5EVln6wXWpBR4kcArga5KSzGT0S98au/t/3
         YUOm7wT85Ya7Kg+wpxYxITIpHKMX2aDU3g6HJadNinhQRLoKePj5pCvGjCo3sAD80KUr
         zf5t77iBgRSIoiuXm2XOUzz0fbe9LK5e9Jo+oPsXgOGBupb1cSHLqEO56vZ7v3H5cXvQ
         6x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640529; x=1775245329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbhnR2aHPiZPhzlyeNXiBA5tvmfsHM3QRYGntWNCKiw=;
        b=L2JbCm4P/FGCm/wq92MLcvVNvZKhoU9KgKgL3NvbvwygXS5BMbhY81DtyXLW8J6S9x
         lp7ZxcsXw6IM4YrvYfBjKBRLvf3dB+O0dEmzaAllOWJJHHGSPLsJeh7i7YCHh9tn6PJt
         Lv2k6FcXos5sBE03Jpg3UKmD/yQHdDs1ehoM4TxqTPkZ1I+T2aTxgYkUPwa2UzAtHeQc
         LG54ldeNae4ZV5Y3na6BiJ11Rp+Yd3OlYylRWeF+1Vl0DlKd7IdI72B9NVLflLUVgeov
         owPGV5FiO41zMwArTsrHZm2KgRcGV8JO9LsEUC2en5afqx8NQQS0F9DD/uBo4nHNQ7nj
         /fkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrMOeTpvZJ5hxP4dvelFaIdDhPVAk9aNxpPWWIrHDSBAIQwlT/sYoc4rY5zWtoOlbh5lv98KD+COX/fot@vger.kernel.org
X-Gm-Message-State: AOJu0YztNxZUMSvpO0YqidnEkqZMf/KdYKKFSxPk6BI78DlSbJ2zNHPt
	Gq1k6d/6gEVRRzCRJkJKLCLZF11/tTKrIOYCABMdBkdzvT+jn/7ltN6VqfgM8K1J0GE/m8dMVax
	FltuMm9XdnEexe3EaDvjYWF8HSHhlrH2GXTKi2Ms19u1AD70eBxJivGo1CnRwo4es+6YR
X-Gm-Gg: ATEYQzwaaOitjQ1XbI3s7EARY5Qo6HdZY8qHoGxsyqIRG+I21K2mFO+MWxNDk2xY5BZ
	/Smjva5rKbAlSWSDa/yz9gAzkpR0UNGAbglnxB7raxdT0SyKjLVHCy7zdjm9gaa1wodffPQxDK/
	ejPlZ+ZvOYcWFb4np4YWptJjor9dynG81GNRw/1T/OzX8ORfX2wOKreENKHGUi2zKVxjFEYWkWj
	z3xVBaO4slVOhDWduPEIX1gFPIkY1SnLjWiIQbUwM0oUrUzPlij2ZSa1g3OYfBQK/PSMwluWG4h
	FsIjjIenyjSfsK7HsPcgr0MDKAdxZkrApkREOT2azVhiOS3F6wwyj584traPldQ8uVc63U/J86X
	ZbSO+9ej3Aj2Hu6CEYqM829UXj+9Vex4y+DrxldK6GsPGZDES4YdEiD0J3zi8P3Znp4qOjAWNm3
	xkSFMy/H9rjuS9yxP2Vd4acjTcxP+eEfy+/m8=
X-Received: by 2002:ac8:5c82:0:b0:50b:8fed:a947 with SMTP id d75a77b69052e-50ba38354dcmr52043981cf.19.1774640528738;
        Fri, 27 Mar 2026 12:42:08 -0700 (PDT)
X-Received: by 2002:ac8:5c82:0:b0:50b:8fed:a947 with SMTP id d75a77b69052e-50ba38354dcmr52043431cf.19.1774640528220;
        Fri, 27 Mar 2026 12:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063ef50sm1601052e87.11.2026.03.27.12.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:42:07 -0700 (PDT)
Date: Fri, 27 Mar 2026 21:42:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Message-ID: <cshlsxb4fj6piuxadtxvxl5rgnl4aljqqrojl5wkp5oew5ynxy@ah3eo4aexe5n>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
 <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzNyBTYWx0ZWRfX0zUE3w0ASqas
 ndvCIX5lDsBq0nKQ0PdgbG/1/RMZ6jkfaENE5QHVYTg2S7UhcRmBYdDFbhcl4IATEU67FWQxXHS
 qLxwNmafp/QWcOTdH8Oy9XurEAQS2hbosYTNHh/htQgma31um069DRwOqDCeI7SFnxlFuNVjPU1
 HTv+HqT+wWKi6pQuNh0BACDkpIcrA2yF9ZmicEzycsVC6jX4igyNVAxZSdAK+2pKq78vfEXSgN9
 SWHJGRTQ0D7fRxMelgnHo2A2YBrRDhr6+6r+HJoKR5R4TuKQedCC4DZYHM07VdlhJOxKR303oW8
 wOSdnq9iXJqausBlymg6TEOcOWWYBgp0IEez6p65Gk6wo7UnF3wKWC7Wqa/xOwyZnjb0a9LiWH1
 ex7U3oW2GQRjYGM+Q3pPwP4adhYJtcemAQ4UE7cNuyVhG4pm3M+LBOvHQrMhnDaXvroaTKGiD1S
 9S9Ejt9tcBFwfo1ROAw==
X-Proofpoint-GUID: 2s5uWVVazOpfHf5MW99TrOjY0fNmxzlo
X-Proofpoint-ORIG-GUID: 2s5uWVVazOpfHf5MW99TrOjY0fNmxzlo
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6dd91 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YMpIk7VpW_7b69MrPvIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270137
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100429-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F8AB34A71C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:36:05AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/25/2026 5:00 PM, Dmitry Baryshkov wrote:
> > Specifying UBWC data in each driver doesn't scale and is prone to
> > errors. Request UBWC data from the central database in preparation to
> > using it through the rest of the driver.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/Kconfig      | 1 +
> >  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
> >  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
> >  3 files changed, 10 insertions(+)
> > 
> > @@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
> >  
> >  	core->iris_platform_data = of_device_get_match_data(core->dev);
> >  
> > +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> > +	if (IS_ERR(core->ubwc_cfg))
> > +		return PTR_ERR(core->ubwc_cfg);
> 
> Afterthought: This change assumes that the presence of a UBWC config
> implies Iris UBWC support. However, some platforms (e.g. qcm2290) do have
> UBWC data defined at the SoC level but do not support UBWC in the video
> firmware, which could potentially surface during SYS_INIT if UBWC is
> advertised unconditionally, so this might be worth double‑checking.

No, this change implies that the lack of the UBWC config is an error for
modern platforms (which it is anyway).

-- 
With best wishes
Dmitry

