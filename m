Return-Path: <linux-arm-msm+bounces-67769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1CB1B1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A4717BE8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB92269B1C;
	Tue,  5 Aug 2025 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuKoO6EX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B05221B8F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388297; cv=none; b=P6QLXOto3c/UlaskzHYlJmsA/E7pN2UcGRI5fULg8lbksdkijljnlpG3L49GHdrD3OCjF7e3SZcJayGdEM2D3m2V9YMNQqalJ8jTCy6efvXKBxxtD0NKFgRD0aaT6q19YmSCTyGHbHe1GVh7RdQCWm4WzQgwrD89tcwLMp/NWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388297; c=relaxed/simple;
	bh=16NaxHMSEZhPQMhjlmNpZcKyw1FlxxouGtxWL5uWmvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl9XYeyiBaDXIAdoC2U8ju0v7Z/MBNsaM4nuV+HpAI7irfQXPZHhCaQx8VpeSAQZTYmAtmLk9a85cST6hMsnjnaYHGFQk1v8gkoujjbHctbu6FWkLI0lZy0aJllSnCJV0MVC9VJvIWkXYtJ1ZRedsU/g+NaDGo5J73/KnV5HZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuKoO6EX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751SGDT012766
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 10:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LZ1Q7mltGYgZKuRjlXj10Xho
	1f26ht9lWK5c6ij/Em8=; b=LuKoO6EXUBF3DJ3QOFvbziK7d2B+xJruqrjmTwWQ
	HQGi0xUweghEiGaO1TCmBXJdUPjaTQTXBxHp+880PfmTamLyYm2ilfpcIDw03eBG
	c+mMLgCOBMzBL/b1XL2oxgskxsRB3frhm8Hxbd6MXYuA+WveRUn1rZhx5yiMPnIb
	gNpQapczuBtAOMSPxz65AYoChJuJTkX0SPVu5tbvYNFXTzORII9jH7ibxDROdiKM
	x3YHb9G1gcnZe5VtTDIPZOPICp9HXHlR5udn6fDMpV7x+7rceQKa589aEQZDKerb
	qhkW3l1drm8MYMNMce0XjFmu0U4pDv4Y4YF5mSyiTXZ0ZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag199t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 10:04:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af199d0facso66432221cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 03:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388294; x=1754993094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ1Q7mltGYgZKuRjlXj10Xho1f26ht9lWK5c6ij/Em8=;
        b=G6b0sVHh27Vj9J0yndNk4PttjZkV5/ONM52k4+Z34Vwcdb1uwNOB+Z2TPL9ch/1xeA
         Wx+UihVU0kZD7UT78Q/aZUJ/JeouqokvqS6BJHS/2ZXaYJxWR4zoj3MOM5Z/Q46I3SjG
         YKBDvgfjGNycih8uWCQ3H59oV2jxpPJoRRjXVl8stR8zgqBIEyiyYiLu1Tos82jzfy3C
         sVixo5O4j8mW2K1mhhm87t95m54lf5OByvqV5o/23hd/MdgHFluDxsZ2IWFTSCupQHUJ
         NhsNcYgy42vTncwvjILqe/MZak2eHzQOEntDl1RqEY+P/tigS/d++dpFDF5tj8S8zqWx
         ppIg==
X-Forwarded-Encrypted: i=1; AJvYcCX8qenck0WRrBI0aNjY7rbZEL/yjCHYZ4+/Gk0Dh7Y26EZY/+XsfQgZH3LVfmqFDc+IjrEXavNWB64bEeov@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlsafsVbyFXYFuwv6wUpzmBzkufaM+Ot2adyS+eQsOQ7NoTaP
	m7OBGkvoLYKa5MiM22+SolsfHArX2S/cMHk5FUn3S5US5UzVUgPZKOoBbLhAh2Xf/macyzueysi
	EJmtXs7zSDMY7/xyHlKb2lzMoc0CaFdG2aPlr3rQ0/OTz/1SAHgqqH34kgDAzNaEb1Gce
X-Gm-Gg: ASbGnctfKTsAWvTc3Qp3kkjZlVjoIqFxb4CvpKaBc88qItZnlR86ddosgzizJc8tXep
	1ZjiKIYpD/W2HjtSrjk/Tv+1MBeEmvlm2iJGi6Xby7MVfTvCaA+sD/l0eJ15GghmkFCM1SWK2gS
	7vyc1L3BRNK9/4AddPUmmqSUANt+hcSHKe6/JL4JMgVBCb4KJ/ibTDchM+ZMFnhT1oXNVAdiLN6
	jYf+bSQPr21jDNbB9+aKwvkUfnu94dewUffrvwkHCAIE02Yd+BTCTeHH8ymAxg+soeU1+BCUeeY
	ae5y0vW81qfivm8dGNXuZzl07h9iLZlgOv+s82YSACOVEWODeP13aySWrFZGOQFcxyEz2oQsGCs
	SGaUVH5EYIK8kLilyIiB0pMqRPtqHNCJXRBDHT3L+73exIvCN8vtU
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr48884271cf.29.1754388294015;
        Tue, 05 Aug 2025 03:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjc6p47qGpkwh31qlCKW+VV6tTU4R+W2maetJnUC3VlVpc14sJK3TH5Iz5iQDFhJnukuCBxg==
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr48883671cf.29.1754388293461;
        Tue, 05 Aug 2025 03:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beb4sm1926807e87.30.2025.08.05.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:04:52 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:04:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rAZ-31SjHqoVZdoTHSohMyCpLf6_9i00
X-Proofpoint-GUID: rAZ-31SjHqoVZdoTHSohMyCpLf6_9i00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MiBTYWx0ZWRfX+dWLkdXU7Sug
 TA0qPFY4LLycAaFXQW++h0qvTsB0QyywO/gDYuPEc0BGFKeBIZYQJ6x6RRllnCdlQVrAvT87CCH
 pnaoVuuMU02Qkl0j9Qth/caQb9CWKpNyg5NFvIRqI+jGLuVxzQywvBx8W0QIdF30OnFcRDE9FDe
 V8LrdvReCJURbP5XGxTjaATtqIvuGcjpQ71hbla53lf8zsLonw5DPlidLIjIygIQIuj6B4GVQdP
 i8HqDSc+V8rul9667EOSpWkuqFs2ZM4mmwwhvf6JxA8FKQ2UJP1YC7H5oWmuwLOuTHVhc4djFn5
 kGqJLi5aDL/U0ZdSM+gzcvgHazGhnTfhQXcMbAwK/9xlnM2fJRX710C0Ravt7RY0DUZtPmuiC76
 wSmjOtDMdiGNefsfFCK38EfrRoiAMghPqOmYpP1YAj9lAPvlx9U5/YzjtJ+UN3SlGK9Yi+md
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=6891d747 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=lzajS59LejGemfuab08A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050072

On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Cenus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The driver is not available to firmware versions below 6.0.55 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index adc38fbc9d79..753a16f53622 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> +};
> +
> +static const struct firmware_version min_fw = {
> +	.major = 6, .minor = 0, .rev = 55,
> +};

This will make venus driver error out with the firmware which is
available in Debian trixie (and possibly other distributions). If I
remember correctly, the driver can work with that firmware with the
limited functionality. Can we please support that instead of erroring
out completely?

> @@ -1080,6 +1129,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

Please keep the table sorted.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

