Return-Path: <linux-arm-msm+bounces-58422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98FABBB7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F0A17B2B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF9D2459C7;
	Mon, 19 May 2025 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lcg6G2b1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537041FBC91
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651984; cv=none; b=jAEPxItbMVTPrT66KGqtFyk/urJ1SlM8+C6FUZQvuprS73x8MwBuxea8IXfFIm30o7vrjWHyu9206vGF8FWCv5DMAZt9KWzD5XptG6LtgUO13hZylk5/LQjibL8Dw1cOPmLijxA4f7R66aGQeRoXVrVcT3T9VBHW6rO8Yu7IMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651984; c=relaxed/simple;
	bh=zFVSB/jLkg54QmOKyFRdojrQh6FB/PFpAZlAM3Co3HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxvmrgMM0A6+HLlIAYJV3AJzdzcNCaTG91G0GJyangIiRH3RJSiQRmkHHKtQW/OInZNCqhBefEkwjNA9J2B2rpxD+GpAJipTFOf2HDjPzBubvwdgqjgo6pfAg+jDOW7e6ygtWhvFr6rqDXFe+wUMdv6ATpoA0FxtZyNS5rNoejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lcg6G2b1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dNUO002033
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12IaN7eBq8hgvdzeUL9X3AaN
	AZFkI4T15f/kPp9SFK4=; b=Lcg6G2b1SOKlxBPjxEhfdQl2ueH0xpdGSZN7PUhv
	+C0Jz8GC30+1yWDiHcsdQE4NwlIu/JrPPQWHHcsIe4IH4qmvB5LH8Ms32BOyU5Xu
	y5xKhN68az798K5T02SAN4+M9AALMbHj+K76Nqkdpve38WmcWjHk1myCEON9O7O9
	Njym7qj3xNWZieOw0rHeWEN097x3Sb7nUnr5vzTS02AZ280bbg3ct3G7Qrs2VBvo
	1pnX9tfz4GRvE668K7rZWTV1HoQrD4MHHFgGPwqwFJwjAaw7tI/0eVWunoqiv/dc
	/bFZaLp8irDiWUS6kpD765SxLLJ+F75rKIyjoCxyp4EqaQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgd0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:53:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so21413476d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651981; x=1748256781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12IaN7eBq8hgvdzeUL9X3AaNAZFkI4T15f/kPp9SFK4=;
        b=O8FSgogpm1u6FuHp+/FgMS4Ovs8NIIhdqKSQXIP7fVeuxt6g3NPNbKexoBtOFpN9lq
         Y2a1yqbaSFcjsgbAGohVVzyaozxMmShL9wuRN1ZBRO/j580hgzJ20lWucT9KjhfB/MHF
         Q5VvHeXkZ1PMA4pH6dO9UB3IJlpybZXwt3XT66gGV9AwjGq0Gat+BN6VgxwlSy/blbAU
         cimLN3fajdKwJcpkg0cCs0w6uvHou6ar2lBJNFBbdtAVHsPLs0jn9WF+DibDYgfjfGys
         V0kc+V6maE8CX9uQbEvD+B+UmasJQ1P+AyejoNPB3kXosh7j5K/aAbYYDucYfQgbZDsO
         SQag==
X-Forwarded-Encrypted: i=1; AJvYcCU0X5RydK1+Xe7VnHn38NhLiXE8VpgmtZDvVr9ljBK0/82OYVAdQ96kFxc569VOoSTSbdSxFr62AvpdOmeB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46UELJO468BWdu11NtAZzctVtepCr4jvoUbu+2wyMKIgU05+3
	0mRLMucBLm0sXL+OCL/CVKD6X2eHYbeHeQdJlzaYO3kpXApg5axbJLBDUellxK1j491OffNoLOf
	ZxpOExrECD33vsc8luHH10tE+8iUdFX9SmhnmFNwZ3JQqIm04E7CGChw0xi0/JRN7rs2x
X-Gm-Gg: ASbGncvzPGytPNhUb9/lv58PAUDODLj/DlhW8aikK9/Zz4qir5vsBP0IujHCJ7ItFw3
	eyWoGPH2RwCnIBfm1Bmz7RTgI8IfmyO6FUJcTmy6zUzteUIeY544j2uspwiY341i7I93nfYWdPs
	Q1m+FwwVjogKi0xiwoQoOOXNb1uy6crzTZkmiZLVpbE7A400lmGboB21gQ4RO1DrIA0FLIat6X6
	XFRS/BvEcmeH0WZ0M37w88RDgux1TuVs7almnkHlQNIAyFktO18wARWcO9YYls9ZIx91QN9MiiQ
	kOJcUvCCDINEYHTiOe0CHmJn9UVBwTkNCDVrDLmMeFmuihVKJ5BaDGa1Ji1aiWLrJKdZGjYvamI
	=
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517656d6.33.1747651981320;
        Mon, 19 May 2025 03:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGosXbIBhaFmJ6p5vH35mNxV1xQHFesDqXCVMHgt8ntxYyGnp2tccv6lOtEix4vLMhGsix3iA==
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517296d6.33.1747651980961;
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701831bsm1809899e87.156.2025.05.19.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
Message-ID: <ni7ww76wwaxx63ikqzvrjaagyfai3dy4tm5aohxgltlrk4yuuz@h52leppsesd3>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0d8e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IAa2Q9qSwG3VCOmU5ZEA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: PhpIkuqLnwjUXPa4w2ZQnVd1RBBVXek6
X-Proofpoint-GUID: PhpIkuqLnwjUXPa4w2ZQnVd1RBBVXek6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX7gKZnZg4NL/I
 f3yVGjKUh/3vfrvFzUwIo8jDeUEltf8vS5zZ5/l5v4Ukp4IwqSDtVOlacvUUdqxImAGm8T2PAmj
 ckB5apjriVUkSbdirOhvtFmtruhK5Fo4PT0sCkTeHco2EoPKwj6lFTuK3O3Z0f3QMvPBtYAMt13
 mlXfm1uJLdsVwElzNfU2gf4BtkBaxau3qm8+vRE994wbbwseEXSFR/X4ZDNGii4JpEgaKXCEjLV
 lvgF5LaYWbcXewgq7O7LxPgiRWYAGS3VQgF63gAJZcsaKVxkhcVL1fiHiSay1fYXSG3zkyaIkFL
 tkwyw1ImywIL2N2HO4iwnECpE4+lCQYfuRGueJzE0WOaSArRPEGuA4euwArdHkv/d8ie31iSGB5
 XFtsDm6imk8JG90Ym2YnVZcunQ38LUlSW9DzfSHpuRuz3Fk5FOdjvg7LFIMSkXS+kCyBMABA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=714
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102

On Mon, May 19, 2025 at 02:02:44PM +0530, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

