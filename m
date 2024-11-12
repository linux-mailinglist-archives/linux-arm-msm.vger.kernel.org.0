Return-Path: <linux-arm-msm+bounces-37552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E129C4F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543AB280F61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DDA20A5DD;
	Tue, 12 Nov 2024 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgnK/HCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B91AB6DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397010; cv=none; b=atESUDNTpg0WBtl0KaEKh7HdeXIeQG2Bc4fRlvFonNn12m2CunxuItwvjlH5G1k9yuBNE70+uuPWOvBREFiWaHTF5OvKLvN0yVylQ6YKpwHcKsb/wY9zCh/nyuOfD04H8N9bQE6KYFIa9g85E51zICbSUuy4tYIbK6Rat5YYkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397010; c=relaxed/simple;
	bh=1SCToesngUdasv6wY3kQZbuXUjos4/uaACDm7pDXkcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YY0YgwDua2/Kk4FwOSHg/rX2YxAwTZ0oetQ7SYDS8zClFyi6HmzGXcL0c9KHaBb312dvDZbqVlzFt+ACdGCVDjCG1XayQ3VVv0Yt+C7lgPdOGXYVoYZc60CI9OEAtD5u35VSaPIC5tfoEVHRrT74sgOEJpgI7bb1pWmEvbdFACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgnK/HCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC3frZs019134;
	Tue, 12 Nov 2024 07:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gScQA9kkGXAnhyDRSo9C0rZNTsYcIt7Z+knm/KcgOrk=; b=XgnK/HCOx5MkrLpD
	/r/zqieWxHwj7oSNcA9xURrlGpMoWUWflrhMNAslQKTXl0njWd1jr34aNrQDV6Ex
	pys+ymyK0fWfSaiJirlsBeImowxBtrRChVhNmANlF39sgFIVwyqxyHOx2UmmrL1F
	/tqWfTbt4WDXV/nHCc0VZHj1595svw767d/ijxr0k6IlklQ73XmS7DhcigdHMjvc
	KqVsKCXvb4UOGX+E4IQ0KvhIhVscIdnqloRZ9pOQnzhaTwR0e0uQyXeelmk/yJfK
	NE5sxcdNIl8U8jD9qL4EULlxYmq9gBxq7hd82IY7nloAlWiA5RgTPwbLnR59VL2E
	rzlP4w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkxe0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 07:36:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC7alI3031492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 07:36:47 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 23:36:44 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85]) by
 nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85%11]) with mapi id
 15.02.1544.009; Mon, 11 Nov 2024 23:36:43 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC: "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        kernel
	<kernel@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH 2/2] media: venus: core: add qcs615 DT compatible and
 resource data
Thread-Topic: [PATCH 2/2] media: venus: core: add qcs615 DT compatible and
 resource data
Thread-Index: AQHbGXOfaDdMdAaBbkCdfsnfG+99A7J9LjKAgDY9ScA=
Date: Tue, 12 Nov 2024 07:36:43 +0000
Message-ID: <7a4bd60bd16240f4b621489f203fc867@quicinc.com>
References: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
 <20241008-add_qcs615_video-v1-2-436ce07bfc63@quicinc.com>
 <ag4hoy7gxnhdcodttldlcyli6e2fzve24rnzi57cdthqvwo3dk@rvn7ahqzrpjo>
In-Reply-To: <ag4hoy7gxnhdcodttldlcyli6e2fzve24rnzi57cdthqvwo3dk@rvn7ahqzrpjo>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: dmitry.baryshkov@linaro.org
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qNsZ4BSbx6UtdY-Jv2TgSkwmMC1G4XCZ
X-Proofpoint-GUID: qNsZ4BSbx6UtdY-Jv2TgSkwmMC1G4XCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120061

Hi @Dmitry Baryshkov

Dmitry: As a feedback to Iris developers. The configuration below is the sa=
me as the existing sc7180 config. The only difference being the bandwidth a=
nd frequency tables. We should find a way to move frequency data to OPP tab=
les to remove the necessity to duplicate platform definitions.

Renjiang: For this comment, do you mean I need to change it like this? Extr=
act the parameters common to sc7180 and qcs615 as common resources. Then re=
load these parameters for sc7180 and qcs615 respectively.

Dmitry: No. I meant using DT to describe frequency differences _and_ using =
fallback compat strings to show that on QCS615 Iris is using the same hardw=
are as SC7180. However, we don't have Iris support for SC7180 (only Venus s=
upports that platform), so it was more of a note to Vikash and Dikshita to =
account for such issues during Iris development

OK, got it. Thanks for your reply. Your idea is good, I agree with it. This=
 is a big change on Venus. We will consider it when refactoring the code on=
 Iris.



Best Regards,
Renjiang

-----Original Message-----
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>=20
Sent: Tuesday, October 8, 2024 7:33 PM
To: Renjiang Han (QUIC) <quic_renjiang@quicinc.com>
Cc: Vikash Garodia (QUIC) <quic_vgarodia@quicinc.com>; kernel@quicinc.com; =
linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: core: add qcs615 DT compatible and r=
esource data

On Tue, Oct 08, 2024 at 04:46:35PM GMT, Renjiang Han via B4 Relay wrote:
> From: Renjiang Han <quic_renjiang@quicinc.com>
>=20
> add qcs615 DT compatible and resource data

Please expand the commit message.

>=20
> Change-Id: I1a06f105f030cbf16f48a32f8c50c814f0dbde7a

No Gerrit tags.

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50=20
> ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c=20
> b/drivers/media/platform/qcom/venus/core.c
> index=20
> 84e95a46dfc9832981ac1c0c58e226a506896ade..15cd78279cb7487f5f1da4e5d617
> da7b4a481451 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -816,6 +816,55 @@ static const struct venus_resources sc7180_res =3D {
>  	.fwname =3D "qcom/venus-5.4/venus.mbn",  };
> =20
> +static const struct freq_tbl qcs615_freq_table[] =3D {
> +	{ 0, 460000000 },
> +	{ 0, 410000000 },
> +	{ 0, 380000000 },
> +	{ 0, 300000000 },
> +	{ 0, 240000000 },
> +	{ 0, 133333333 },
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_enc[] =3D {
> +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_dec[] =3D {
> +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> +};

As a feedback to Iris developers. The configuration below is the same as th=
e existing sc7180 config. The only difference being the bandwidth and frequ=
ency tables. We should find a way to move frequency data to OPP tables to r=
emove the necessity to duplicate platform definitions.

> +
> +static const struct venus_resources qcs615_res =3D {
> +	.freq_tbl =3D qcs615_freq_table,
> +	.freq_tbl_size =3D ARRAY_SIZE(qcs615_freq_table),
> +	.bw_tbl_enc =3D qcs615_bw_table_enc,
> +	.bw_tbl_enc_size =3D ARRAY_SIZE(qcs615_bw_table_enc),
> +	.bw_tbl_dec =3D qcs615_bw_table_dec,
> +	.bw_tbl_dec_size =3D ARRAY_SIZE(qcs615_bw_table_dec),
> +	.clks =3D {"core", "iface", "bus"},
> +	.clks_num =3D 3,
> +	.vcodec0_clks =3D {"vcodec0_core", "vcodec0_bus"},
> +	.vcodec_clks_num =3D 2,
> +	.vcodec_pmdomains =3D (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num =3D 2,
> +	.opp_pmdomain =3D (const char *[]) { "cx", NULL },
> +	.vcodec_num =3D 1,
> +	.hfi_version =3D HFI_VERSION_4XX,
> +	.vpu_version =3D VPU_VERSION_AR50,
> +	.vmem_id =3D VIDC_RESOURCE_NONE,
> +	.vmem_size =3D 0,
> +	.vmem_addr =3D 0,
> +	.dma_mask =3D 0xe0000000 - 1,
> +	.cp_start =3D 0,
> +	.cp_size =3D 0x70800000,
> +	.cp_nonpixel_start =3D 0x1000000,
> +	.cp_nonpixel_size =3D 0x24800000,
> +	.fwname =3D "qcom/venus-5.4/venus.mbn", };
> +
>  static const struct freq_tbl sm8250_freq_table[] =3D {
>  	{ 0, 444000000 },
>  	{ 0, 366000000 },
> @@ -943,6 +992,7 @@ static const struct of_device_id venus_dt_match[] =3D=
 {
>  	{ .compatible =3D "qcom,sc7180-venus", .data =3D &sc7180_res, },
>  	{ .compatible =3D "qcom,sc7280-venus", .data =3D &sc7280_res, },
>  	{ .compatible =3D "qcom,sm8250-venus", .data =3D &sm8250_res, },
> +	{ .compatible =3D "qcom,qcs615-venus", .data =3D &qcs615_res, },

The list is sorted. PLease keep it this way.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
>=20
> --
> 2.34.1
>=20
>=20

--
With best wishes
Dmitry

