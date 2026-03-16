Return-Path: <linux-arm-msm+bounces-97961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEGIJ6EFuGkWYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:29:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606C29A5D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD1C8300DF7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6A885C4A;
	Mon, 16 Mar 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e77zl26j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIJNeIqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B8396D0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667742; cv=none; b=fbyEq7OYLxTe3ou7MSbSIbig1QnIwJ+UvODOWVX943JpfGw5OhjEbrNLrgIhgDLC9jQ+i4KoW4B3lV2WWwnd4WlN3UprYWZl5a1r2l07fWAde0SSupTLcIkkEXUirMBST6F2wRbR+rDU76/vCpfGWCDWdkNW3OiaS/6xvT0Tets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667742; c=relaxed/simple;
	bh=VjPa5dKBAL0HC5Ak2oFuEazOPoP1X2PPGkhAT5vG8+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiMAT+rmIOeDhPO7Gs9nS11bwkFqQHvCoHKvd5nZl4NnOiDuD97hzAdzZdz7XZmiz/S7VpaUxpgQtbZSyffuBuJRwG7mWwippV2shUSHuLakW4r0IGWUeDk1r8olCnSxpjAo1zSXfzgoorfK0hax9zc0Ghdu1IUAmVNC3aisdE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e77zl26j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIJNeIqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBoiwW3777762
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIboW9VuwE0EORPl7TKuMP0oFZdyasnxlARwx2DUE0w=; b=e77zl26jnmtKd24Z
	kvoS9enBzZRClRgwEQIxDDzM/H6edfYJ0M3wuT49dP8cbhpz+NeHyYQCu6lsA/hK
	KZaBsWMh2OQE46d4IAYglcIOfWT3c6hHc/Z8qspEMrvO+Al56XH9sscBC1s5oxil
	RyfZTibsCKwRMJ3JbXGpLEfMjPFee6Z6HXqeZgBZyhBtWlWHpfR9lt5yqM5fKro8
	eMEyOLCuqw8lWN4/wBEWKtB3EOXulKCCdDUkdcFR7zFMEDWZLs1B8baM3raC/LVs
	E3Ua2q/+6F//1Nfgj5NFqMiZYnmc9W6yhH//MU2xhP6qf0E3MMYGzluapUtYaQsB
	fEZpxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7ws3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:29:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so356227985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773667739; x=1774272539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIboW9VuwE0EORPl7TKuMP0oFZdyasnxlARwx2DUE0w=;
        b=UIJNeIqO7tik4tSy4IWZsTvDlQIVxFmO/tM8WPBYiUgE1UYsknX3GPhxcuim7Q/0wq
         1zLokzwKG7JTmeBPIj8WHkktoJqw1cewtPUka/PDnL0teZHb2aBVVx8XQrkEmpooJlRM
         f+A9kJd2UkvTjnwR194OJAQGosmPTNf3r2BCZ4d2Ixx4QJAf/W0Vr+0v1jepPox/CobG
         R4re/mqC/TUjZjcPzvgIZ2vToYoc7MVpUlHzSwATimK7dcQJRZh5Ha8UQwGtb2xzTKCf
         qpKlL/qbPZ6z2Vg06DvTj7PS72FjWJSKnAvjHkZB0FPQB85q3Lwqa6MWxTGInOvrPaA8
         gPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667739; x=1774272539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIboW9VuwE0EORPl7TKuMP0oFZdyasnxlARwx2DUE0w=;
        b=djUV1S0dQ9/bultlVR2OcuY3IfjNNvo2vkbPjedetB7CsWWt2X/SYF4FmO4OhIqaG6
         wh0hGSqeOoDW5ulKCX/RXI2vecyb7XnF4KiWYhKjo9yxBFLJCIH3BvLuGYvCFWWGmk9c
         ZFkbfXfmjfNkU5KgxfVjU7CQWtKrXXX4k7NHmvLl2TLfYTE+9A3gzGekM0jmtDujDrni
         2e8pfkRrOeojmQNYgR0tX0llR9lUVPQtbFnXxG3l2ayYKMg6+q7EQ/L/l9NpE4d+lOOa
         kLp1xNLSWhBvnTUrTe46o3t2PJFTapdXkbNp3amoZxUBwiaWLnYboDIVx4robROFxReC
         A3dA==
X-Forwarded-Encrypted: i=1; AJvYcCWtgP/u59HmFZRJkf6GWVgin1vgYzGOLtZcNbd9DkNbxMEfmnw9RVgRm0khxwJS1k/qrSKGG/1/69llCjj7@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMhWiXU0NKVwXWVeNopTMOY52qJbaL4zIJL2FIEWKbOMBKKhL
	AyOZVOywB7UyE7DQ7a4/Bcdp1XjZzIvpCbyM72bHC/mafykx0+uw3DQDioCXC6NIokEVDchTlXj
	aQrWqmt5CD0gH0PiWkJ8bV99zkTWBlb+NFXGzhkjB0f9cY8ueybWZTgoTkLd1z8T2Kdh8
X-Gm-Gg: ATEYQzyB1oIInpIufJUJYDyxbOAA0SpoEjYx5SuUFWx+ghAjht0DT9nA4g46G6WtHUU
	6I5B3D45ds+gZlrA9DXBSQ9IZzPrE9SWDNoN9N90XAO7/0x83n9xnUHg1MTqPyMhsoydk1Hxm1r
	XDZ+SnI0SXTrHpAbymtJywNGJSGaOn+ArMq6LIt7ffTjDLxs0rshd1FYMpggzJ9ISFXmJdtDqbd
	QoFNcBHXeJwPXUFuLPGmaNuw8J/+UyD+COuwFuByXS4scDTesPHkACGIbd3EO8z+SBmw8Uj8O/Z
	3gt8DEDqGWmJpyXLAdwfMo6wxZ7QXgIrYlFISjiZHkbTOe9Ra7a4RKCT+UMrBHX4QjemFaKCJJU
	DWICcBDNsUcBgpNBBLmg6mT49PVwel8iwaTDP4CPGob86yPCEOGqS5fT1NQm83I9r8s1mk+jTHg
	l6omU=
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr1344672885a.7.1773667739384;
        Mon, 16 Mar 2026 06:28:59 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr1344669185a.7.1773667738744;
        Mon, 16 Mar 2026 06:28:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156033a29sm3400429e87.37.2026.03.16.06.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 06:28:57 -0700 (PDT)
Message-ID: <2a6698ea-c7b8-4038-b4ed-7a7c9acf3d05@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:28:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change
 detection
To: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1GKdI4Bnfy7r1E9mRqxc8CoIUkHIJcNV
X-Proofpoint-ORIG-GUID: 1GKdI4Bnfy7r1E9mRqxc8CoIUkHIJcNV
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b8059c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tN-bM4_ZalV-NnDHEpgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMiBTYWx0ZWRfX9sYlMwIsFUmT
 aZSEF3KQN5Chk+1Pi8kqWjzH21D+y6OKSp3mmgSR75d7xPMexOWVddZBtsOPsNmP0rlUcby8Vg3
 jLPW4vp8005k1vTSZnq6/49Dz1HYCHcKxdUq7WYuairQy6Ab2x7LqA0VBDioKnSukQ6SswCfxjd
 Nu2QYmJphaWph2tEQwhWSzX//fL6GWUTTP8bRzUT7K/VBksQG5+cujH6SLnJ3qxVHYumtifCDgL
 5tSZ+xihnT9R1Z+/FauYjwBt4+p72VgKHrxmmkfRITMsvIXZcVhQWy+L2iBRqZb/D5hbGjCJHop
 /NlWx29S1ovZCboivuorGrvRAdyK7BZnzjgYAkLnUZbX+dfYKLuj6Zm2bO1jK7zZ4RlSRmfYnhN
 ae18JOXqllfwpU4XkfHWRsbZiqaUJYe3fhD4y4gvbd58PE9QY/QvVliToksm828AThnOk9xkIBz
 9VBvk3sjiCWywjFlLYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6606C29A5D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 2:23 PM, Maramaina Naresh wrote:
> setup_fifo_params computes mode_changed from spi->mode flags but tests
> it against SE_SPI_CPHA and SE_SPI_CPOL, which are register offsets,
> not SPI mode bits. This causes CPHA and CPOL updates to be skipped
> on mode switches, leaving the controller with stale clock phase
> and polarity settings.
> 
> Fix this by using SPI_CPHA and SPI_CPOL to detect mode changes before
> updating the corresponding registers.
> 
> Fixes: 781c3e71c94c ("spi: spi-geni-qcom: rework setup_fifo_params")
> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
> ---
> This patch fixes SPI mode change detection in the spi-geni-qcom driver.
> 
> setup_fifo_params compared spi->mode against SE_SPI_CPHA/SE_SPI_CPOL,
> which are register offsets instead of SPI_CPHA/SPI_CPOL mode bits.
> This could skip CPHA/CPOL updates on mode switches and leave stale
> clock configuration.
> 
> This is a single-patch series.

Note this ""cover letter"" is unnecessary for such single-patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

