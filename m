Return-Path: <linux-arm-msm+bounces-114007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zNVcMdY5OWqEowcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:34:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 333196AFE51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:34:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KRstV2Ug;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xb93aSH5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41B3E30062F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348023AB286;
	Mon, 22 Jun 2026 13:34:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1E1A38F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:34:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135249; cv=none; b=s4Z5DW7Vw7ryBaVnvtMalmhM76Zk7u1VILqgYeHmBjhVs82ctp+ApopBU/hyhO+13EwtO28K6ogfvADwpwaTfdFdJ5YynW/+JEIB8gQLZpQ4KHn+Delnrkz694LPOE4LbgS6yTQOIVyFovmBk628wDtaCd11ghDmDYSwCPs+isY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135249; c=relaxed/simple;
	bh=xpM1ZEUR722AzMER/5vxKpdKmElmxGBgeGFi7LDxvpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIMhVJyf0PWKQcgWB2MjTejucx0PAyMPL/hdx/6h2TynCLj9GkwXNye/9Y1ZKMsiF0wHPiBU6dbmWbE9ksREEtvapTpdJglGxi9iIgWqK3KGLCCFp7F1Sz2p9y+BzfZuqPaEJCjJwRhSHg8U7xzJkHYud+mlKyt/x2HjHG+WXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRstV2Ug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb93aSH5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFqCo702919
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0f5BPDdIj7CppYyldUI6Otm
	CaI6kqghntkZ903ClG8=; b=KRstV2UgewjURqh7bsdXbZNF+7uBIHD/LruI4miH
	usE5G0aKqP+KOU64+hmQDZUARXVQ7vzfEsThQ2b9ZxR/+tXhusjauBwuAikhyHBz
	BMBuQG3yUAye6vOYpdVZ1E9u8/Cus8e7Uxtu+wrnzOwDyHJNdv6zWzeHtWUmSEu7
	YkegMMLgSpoHOiSU0KxgcHxbr4JXFeVZkRze5eHHo05WzAGl4PO4GAVMwNJy1Da0
	QRkA40E2xUTTlG3/rj7n5wkkcZe7xCU5HAEB6ehRAIapgWHhOm7XYEv3aesHqtXz
	F+kn/CoHbPgGz63EUfF/hQRCkvbA8FvMQZGp7eF08dkF5g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0rkv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:34:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c17bc96afso1842476eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135246; x=1782740046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=Xb93aSH520vG4uc5J+yjugHct3rxOVo5+888bkvlqo+NXnAoD/g0xqIIY9VajTWBJy
         GD93+R/cc2DgQ8XYTVTpHqMr8SFLmsVgCeXxo+OCzU4SS/oUHZGc82Ry03OGl+jqL+Xk
         WynWKSjK/00U2EdMpmgi3703A+X7Vb5bk8i4hA/woIyIHsuuylKkrsTnJxCjmE5zD7XG
         CzOLfrnRXHESp1AgXp82T6wB2+Hj00y34pkLdaAdzIx942+zb5e8mIcV9sTD9cbNNBQC
         yb0yY8rzjy1TDUdkCIndAvNYfSdYYt0h6WuhNfRVf3CbYdCrWbFWepdVCn0/lS2wwqRW
         /YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135246; x=1782740046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=SfT9joEqTsq74DfEs6Vxb33Jb7n9XcNmklVR9/+aRqYJKOyPGyJb1QABuAiFPFHsWL
         TWOGxss+0ZkFJlBUTSKAjLQ5iy6jQaQ37MVAtbpN5ZIGRPOLEDcDABKFfqYxVs0EImB9
         6NENGMqwaqtQHA5zGneyWiL8fRRUUiipc4tQtzKeRunaO0+NCOMPaKsFb1bjZLhue9Nj
         hvQoIB63UvTyR4gkxm6bUFpFV0JVoI1tVdRNg1E9v7x9nyn+eY8/hoABRA+slXcmZ62E
         /rgP3gB2TJp9JW9scpIJ0loVISQSU0LqoB/3JJMbk1eHLCflojf7pfV25OzioP6icZue
         ZjuA==
X-Forwarded-Encrypted: i=1; AHgh+RojwrDwUjltbBcbNgocR1ZRC8RpOQi+tpTFwe8oWS4rLM16M5dzy8FpBBvtZFwCu4vrKHiZCDfKSj6zLX/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2f8UKWJnb6xDCb2uXLvAt5lmH4rF3CihptHo3/oHp0HlN3jBs
	I7X6M/sB/x3/G4L54wrHWggqxswEzFRMbNaK7aeWvsdnHJbxK6T5Txbvyvd7mWJvSx3a53P+O1M
	ok1btshrcxnq0DUzIosOHhvstXxfzXPVAwiIrfvXkXFa493NMLiL3CBTyq8B9k0YbzzrC
X-Gm-Gg: AfdE7cn1SXe4xAGFdBAkZi0h6X2D2i3CI/3ra4cGfiL+Vkaoz8Ng08SJB4DjEsbUwMW
	7VfftXd0RpdCogR2eaUg5Wcggsw5YiDiZFny2mIRsKGVJhAHnF77qOog5RBi4d7QlmptgYbqHXX
	Qj7oDJ/y2+Xpt/DCSUqzXB3kYOm7nYcLWpWnuInPXsXfZKTLG9O4DV3dyDF/S1ur11hbnF39+u1
	CX7Pnn1/b7HE/7DJJDgY/Nobxv/Fa+DlY38JwIG9/plmXzOmD1wWcC3MZrnQU4mjsBb4yS96ySU
	LfW6KUXiCX/d1sDR+sD7OdaZm72dG8QXbo3i0W5rzTEYpM1sO+v1IftPb8/3UMX8D5HsfQjL8iS
	LHAu6J2VOlxmnqNpzHwGfPO9BVxK31MTG+J2TFXhpJ3CE2vvoQWh1CZ6urA==
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546747eec.15.1782135245774;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546718eec.15.1782135245185;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm12707995eec.23.2026.06.22.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:34:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:34:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ajk5yq5F9pri6sKf@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
 <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX50R4PIzsZbbK
 MZjm0nPu8ExVotn/ZuxJbz4GV65lIJO34ZttXXAvRFOy4mMgJGVYu29motSaZAuwQkTRQsTcUkF
 7WR8xEadHlZMTP6YOT0XFlnvCi3IjaY=
X-Proofpoint-GUID: jedpkwZvFxj7msz3EjnNpekM5SIUFM5W
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a3939ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FiaomCJZojttUmy_5dEA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX43DC4FBpIEby
 56noZrgS/IP9ds6kxmSR9G48l0OhGRUuZIPAYmPhg3OR2EhKrd1j0Z1qZjZqbIz4Q9a6R/poYAU
 ptm/3xDVNSK+NRkokpUsokA+CzPvBU96JSUWMogxrKqZe7PRHVZ3PIuID4ImNrUFO2gyHDl0AI5
 TskfqSrvgvaFRyvvparQkgRUcUlE9wmfwsmnpKV6QIEZIGD7oLevnsRLGr++8Q1l9sVXfZ9H75k
 rpRxNLOi5XoYGu/3eHb3MDyG46/n6dZEIXgNrvJtPmcj6+zvhkhqXtWkW8HL+8KCe7TbHuJDKgs
 96QKPqkGAZOKLCqI/6Qfmy5Oe6yr+FL3ko+PbeJUNPRiU7HWcccG5BXmMSkNnv6Ud4cRVMigJMd
 cUWfWNIVUkIW+VF8tQeo6VBtSzNlIGY+pQpq2aDizeTEQs/JqmADS0LVCLFsceGGG4RfdTkt7H+
 hWuBBEP4BLM/blXHIGQ==
X-Proofpoint-ORIG-GUID: jedpkwZvFxj7msz3EjnNpekM5SIUFM5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114007-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 333196AFE51

On Mon, Jun 22, 2026 at 01:37:06PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> > clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> > directly instead.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> This must be squashed with patch 7, otherwise PCIe won't probe on
> Mahua
>
Okay, will squash it with patch 7 in next version.

- Qiang Yu

