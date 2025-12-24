Return-Path: <linux-arm-msm+bounces-86534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA07CDBD4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E57430072AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3F334C30;
	Wed, 24 Dec 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elRKjmpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgSfsdTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE23346B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569271; cv=none; b=FBG/3wJ0sresEu5JYEaYVGy/gvh+zqQYEsS6igPoiUY6sPbjm0PNgOloZMMl8ZHBhT4Li5SxKxWZ5fejDdwdYg5uJ2M5VLqSi3fyxz8yF6EanDDjxMbGRz3qopMAB1dRmZqcyeR5BOwzw9CTbx8iummOY06vk0o/uJY6jLx7/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569271; c=relaxed/simple;
	bh=6Zs66C66e51oF6bvJb8P8PjF0Cgi9dm/YRAGCfn1CkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVuKWZiZHJr0r1czY7PYlzFi6FUW3wOgd+H9mpO7yE9i8uw35FhSHkvFZf2Zdyd6GI6H5ExgXkUWJxjcKkxuBapNssV5Pqb/LkDA00MHFPa5uc01blRiMmG2vUntfJAmqnFy+UYrRINJm8+PFixOiVMCC1venSB70XhXYoPfOBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elRKjmpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgSfsdTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17ZkC1597861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SQ6f7DLxCQvzo2zoEIFtp+6H
	URQyrcbTpjg0JX/RPHc=; b=elRKjmpkM2BGjT4K4eEatMZAFeO8QrUp3gQFDv1f
	ePk3FhIjMdEi9Zt7R0ewYBWOSvTKJmHEc7lZAYuQ3ykNHXfYd6aZJinB2I5j8oxH
	FRrxPuTeCGTa8Itg+PYZfj+VLtR7B+D7JLT+44Xpk7TmI7UbhWH6jgEJKgNdV+8O
	R1fgPM4VWZdyFw1myrQyQG6U9L/UPLtAPINMi8TipMUSI8/bBAlBikvmIJeU1BIN
	oDyd2p5S22lWE2riiIbeJmGeJKKRIyRS3mKw0DoGdTeIH+Gv/cyoZimvFhnhRPvk
	5/fFZ3obql4sfBujBC5pmXHf8GO8uGoeQNeSLxrW/BkOww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h6v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:41:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1532010585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569268; x=1767174068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ6f7DLxCQvzo2zoEIFtp+6HURQyrcbTpjg0JX/RPHc=;
        b=fgSfsdTxKB5Dz2KVAOcCAov3lKuadn6axfrepwkw40EZgW0r/GHY8J6lmCTXILX3Be
         xDYhNhG2+FYbrRikLhcAUUn1CNkF4dhlc6yyrURwHEOAwV2lvcVmXEqR6sv5ryZVWnCr
         0b/jkvQXEVbVwJ7C8F/okJUydjHarWQjcbY1U9SyTPE7Pt5SGNOHO/RFZsiGCNmw9DVK
         r7A6BlvinY9Pifq2DxLvk5BNXwSTnHd30D0prO16jBx1jBRNtb0TKfNBofHxMO5dZjyL
         q2XjbBoYgI0tN58ESPQ858ADz03PTfqvtkQEMomgYsup0Slt/hn1LlNh4ozeXWX2bP2I
         PEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569268; x=1767174068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ6f7DLxCQvzo2zoEIFtp+6HURQyrcbTpjg0JX/RPHc=;
        b=wg2j77PFsJ+OMZVd8G30WrWDe/zrmibopjYLhLpN4m7fqJxh8ZsYqxG2Q2A0MwbEEd
         3XcFNIdBnMfe+ZZqWg9F2PHCAboC3E3vYAtK66Oj6unv/z1163Ng1m353MML0Yl0AALe
         noAbH1Np1KuX7nehSLpmlQERzBr3OBKot+7uy5Juqa2vFrNwWDDtNZlkWQ4R+jjPntoP
         jI4FycZk3n9XSMFDs4wTONGJJaP2s725F9rq29aCjtpV2zySPJBdVv8VR+8Ph9dE/dG4
         7yieHoxSUV1L6LjszYCWfTDt4WmSfFKZNIrKvwqxhKnwocDs8penB6QCM/VijQaY5b17
         e68g==
X-Forwarded-Encrypted: i=1; AJvYcCVhZnXMPhIehz9V+4ugH0U3+JynV8K1YTqGwG3EjluVoyTb0TLjZhNAMeOmaeIB53ItyZR3EavPQc86UNlz@vger.kernel.org
X-Gm-Message-State: AOJu0YzJed4FI2oFja4r44ccNvbAo8wTL01+Ikpi2XQ8NIcNNCTXVaXN
	7vVeZr1hRerbCqjbDBcxWtwVg5vWDyoasewXjoL4QBjCjQc5HPnCBw0fB+9zYNIEGM2Mab+qH5W
	gDeYznHqs8YW/XDcX8wM1t2F922zfDzEZxV4cPw6NO5ZQnAHDuFVqiYJkS8wxFFH/5zl8
X-Gm-Gg: AY/fxX5hav3HB25zgwGs9I1ZBmaxnB7uf7whv2rGL6ypKPcycAxEf9Qbn3IEP34AlWL
	22lUVSmHG31Bv5L3xN6SY7edtFS22EnSpsbvPJiUZ7IKyM1PDhjK26iEoLhm0Gz2XfrV+tzc1g2
	suWbaVrznxbTkBhGHgSOdonqLVpgDHZec1BVGoWBQ5JZ3Vzo/l3BaaniyXVGMqmDfBguE1BfZ8M
	KkEJjUcxKkPxMo5IOIx3DxN93uie7hainfhxMIVPYinQecPH4OulWdVeUQt7GsWuHE9urxnOfQQ
	cWyLO9qLwDssYqkrn5O63ND2wQgMl+4ojrhgbx6xooP5OMuuX2nwAjeYrcjTBE7oJRNzDL5NV5F
	PPq04YU8pns6+MhdA0X3XWQ==
X-Received: by 2002:a05:622a:428a:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4f4abd026a1mr231577141cf.24.1766569268480;
        Wed, 24 Dec 2025 01:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQc/ycrEnXUpKToNeaSs4N+eKD+QMU/+LSgAENEXipeVqqqlcrAtRbgahJ/iqg8JC2K5dwjw==
X-Received: by 2002:a05:622a:428a:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4f4abd026a1mr231576871cf.24.1766569268031;
        Wed, 24 Dec 2025 01:41:08 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm1261298166b.31.2025.12.24.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:41:07 -0800 (PST)
Date: Wed, 24 Dec 2025 11:41:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: x1e80100: add TRNG node
Message-ID: <boaewq3bo74emhq5rfssdbnu3tbqvtddodqn57bthywvo44wwd@75ifota7jfk7>
References: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
 <20251223-trng_dt_binding_x1e80100-v4-2-5bfe781f9c7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-trng_dt_binding_x1e80100-v4-2-5bfe781f9c7b@oss.qualcomm.com>
X-Proofpoint-GUID: r_8wr936cYXLCchXOdTJrXp6CV8QAyrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX9jNJgD0SPPJr
 VA60FW4Ud4DyY9hnnKDhqASFw5Ek/OcUZy+oZIPURZ1hZtV4I+Zolh258jYedm9H9KBht6K8e/Z
 z3n2z4UcY+fCAi2HsW3RBKRmuYZgYh5tepcQx9VfAPTiVQ45HYaIiEpYTvkZKIdcL0loBTmWRoe
 RIlBvkBZTacqMB5J9NaOD3EqenCVZDNdeD+OsI7VoiRCRBaHwzx5oIKYrHrncLODKDqIr7t9kP9
 c31QOji4P+aXQuUX84ig0T6ubRyOvMZMq/Nwh+H+0Uib9FP6xnJ0cVu2jfTjOhncDfKnbvkdVgr
 ECQ1/6UwdOJOEad7207SxgZMKGch6I7wVniio6YYyoWzl2O/FBKSL43Xx9dHGsEsacy46oBDxh1
 wJgFqkV8lOZBDMf32xlQLL5/HCINnEqRZOrDpE3lLzaKJ/el+6GEBz/DwN8BhfX97M2TSL9NVEd
 iU8cQgmK5f80ZC/VwEw==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb535 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WmeePSlto-DxRHfBUH0A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: r_8wr936cYXLCchXOdTJrXp6CV8QAyrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082

On 25-12-23 10:18:16, Harshal Dev wrote:
> The x1e80100 SoC has a True Random Number Generator, add the node with
> the correct compatible set.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

