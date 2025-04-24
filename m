Return-Path: <linux-arm-msm+bounces-55362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA9A9AA73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619DB194036D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D86226CF4;
	Thu, 24 Apr 2025 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIzUkKFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E062B22129E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490492; cv=none; b=t40N5rsPwNKoNnPxk2OIpu5NQGucRR1LqrxYyw3ez/sNlxoMfrvqQSUGaZGfGz2DEercGyXhPg2ohQf/qGNEGCikO2R5+F5N/3Ue2a4IT9j/ReXtl7jduypDAgJIo39z5R6rpUrt0P9EhXfdYiZ79fmw4Lil1JbSUWonyqBP2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490492; c=relaxed/simple;
	bh=dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTVBz81pGgwbgvRLSkuifoM/StxOiaArFQ9tHIO4OxyfrYHTkp4QU2n6l4JMkXPDCdHtAMY79U8IYEPBac3UBsIBb+jMAcexJvTNYEv6PsEvnzWeqeRDpl3zZqYWxDcqCPhdLVTM0L2U50gesmilHAPOOCuKRAeTNNeEUE7RGvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIzUkKFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9wN00028362
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=; b=ZIzUkKFh0PKsZ2KR
	S33zbxVPl4+yLe6WLwHArPgXQhKTZ+Awl03fU4mcgrDGcklIGnvoQs4eOGRywuGL
	N2UWjJLGF+elFSuu148pWKuPgkhJJGmLCiMn/35a1gWjo+2mdxVMmjfmzouJxg9c
	lXyoHEBqqTBTLVLgsHdpWbTWOcmHN9xLxcQ18v9Lhm3sAnV7wyi/NutKuKMtRHCx
	lyr/maVu0Qh16ygkTrsAEaYDzcznjXcd2H5svQ7Jou4Fqe236PEMgMjM6lL+6UVb
	ek7I5MWgZ7OX3o/omaAJCSIksZjbeXyBVV2BN2E8Ujkfr+B0VIR9WoNHb6T3sVcn
	QTfjfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy5663-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:28:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so133517785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490489; x=1746095289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=;
        b=FSTTZxMsXgjzLZDqVEqARjHIdD7bO7aV1MHoN4BcRnlskBC+jYLQQv8Dqn3imD3Y96
         caMcvViyN41/6pnZrXr9HOw1vkiZ4gFVs6yGbJN8EbJ/brcAa8x7qeFaXxaG4MUpOwIW
         FfJXvSh5zEVn6HiFTFgUp80ZsCyI5FSFqb8WPBaSDLoFxrgLEGWladbUchSskEkTZhas
         4s3Z8iw1Y3WVuYP0+lfgAwmhuyNYdbq6E9lQU39+OsmGvmjfLMe9bnsxBIrPNu4+zhzF
         DgutOCmKWNcqgXF/SNVEQvfh9o3bDzecm8khWMFn75Kwm+MTKfXmkBR+LoUMOoIPCzeg
         B6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVOT3VNYQmkld2jV46jAT6XJv5998N5lv1/u9aLLnzws3FAsC+bOs7J1RDFs8+ayWl/4xm+bmfpmh+EiNdx@vger.kernel.org
X-Gm-Message-State: AOJu0YzfW2ASgIYTlcWSJRHhNh9GECJjgJNZS7uwfejcLIwH+WETqB0K
	1dlwxZH0AIueaOrYmlFm3wdnanlW4ouraebL73vhG+6lLHfD4nVeDes6jGkdcuq08CTIyW4nMiI
	gf+oeVVxwp0Lcgs1ZbMEk9EOTj4gXQbLkXAPUSTQ+g0pOFh1m8Lgm+Wk1H2/ezlzZozoGQR5sFY
	YnQETrAqLFIWYVt5XuB54RZQWTUSpzYkEK6d/yHmI=
X-Gm-Gg: ASbGncvdW88wnVvdEqv+6c772UdZgFr+Toq1yNyFtc090mCqCVCa/iAC/JbDLW7xH1I
	pJGQ4hw7O6I7aqGmk99dKFA5xkLRcMQKr3Z29CDxDOqPVfH2ZUbnH03X+12O+fxJLP2PXx3E=
X-Received: by 2002:a05:620a:3908:b0:7c9:2383:afef with SMTP id af79cd13be357-7c956f45eb6mr320450485a.37.1745490488980;
        Thu, 24 Apr 2025 03:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5BZlCzf2Zo1ugwuFPVTG43+W/s7bg/g7I+h0Q5YvLmNtAP024uFmveP2mjEmcoy+ivjTHrQbqnbWyp7aw5WU=
X-Received: by 2002:a05:620a:3908:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7c956f45eb6mr320448285a.37.1745490488691; Thu, 24 Apr 2025
 03:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com> <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
 <hjaep4muhpl2t5hfajnmvaueq2m24rwbjkfggvhk7otl6naeoi@hqs5ejhp4sef> <2ab8e807-6fe0-4f59-8bcb-0870124021df@linaro.org>
In-Reply-To: <2ab8e807-6fe0-4f59-8bcb-0870124021df@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:27:56 +0200
X-Gm-Features: ATxdqUEA6-iL777V9qP2C6CLVQbLEBUOR3aB-ZkTOJXgCuPugvYUfVi5WAf4m00
Message-ID: <CAFEp6-0tDYScsFkHCwF21rCx4stB0P1An3QS1DvwisPooSxbgA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, rfoss@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfX7jbGkhHCDvs1 J/JJtUO+VWu5kqRRtbVPiYnnTfkpfOEBLPjAkXkooW6+tHufaiDOd7jsZmbpL2AXZKnMJOacp9J SK8DtDiitLGd8HWLr2MUNpma+CnwmUsQ+h99eLGEz7zMdo5Vj97KvMWbYMuh7vUbl8ljLHAEPfE
 SAZ1ze39A+dAwaUz85XHgVOnw2KsXQd38s8kQnZUfWAB+joTgMbvhsvHom//VAJ7Dov3Ed+iiEk 0PBtToeC8FU7B41qWiGvzOc5qUBqme2VoVMBv5gl0wFw6GD9UlIQorTpBeylLVYhC9FyzlciXT9 13eH3eaX7BEiMYsoN4ggVgwFTDvin08YgqVkGxZYWn++JOU0ypd0gi/bpObzYgVXfvwLmlJcqOG
 gfWfFKa2japsO2MqhKUzJxQ+CWQ8me7G2aBY3Yfwf8nUAY9RvMMokgTb0vP7gDnhiWsdBF62
X-Proofpoint-GUID: efE1Pp7Fr4jTHFTo3Yok3FrTmYiHndEU
X-Proofpoint-ORIG-GUID: efE1Pp7Fr4jTHFTo3Yok3FrTmYiHndEU
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a1239 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=zU4xAU1DtyMVwtNcgFYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=936 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069

On Thu, Apr 24, 2025 at 11:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/04/2025 10:22, Dmitry Baryshkov wrote:
> >> Pins are called:
> >> - VDD_A_CSI_0_1P2 (for csiphy 0)
> >> - VDD_A_CSI_1_1P2 (for csiphy 1)
> >> (both of the above are supplied together without individual control)
> > Is this a requirement of the SoC or just a typical implementation?
>
> Its usual for each PHY to have its own external power rail/rails.
>
> In this case the PLL power rail is shared but, that is not guaranteed as
> a feature of these PHYs.

Indeed, Then I guess it is probably better to have both a
vdda-csiphy0-1p2-supply and a vdda-csiphy1-1p2-supply.
Still we need to agree on that voltage name, before I submit a new version.






>
> 1p2 - digital logic is individual on this SoC.

