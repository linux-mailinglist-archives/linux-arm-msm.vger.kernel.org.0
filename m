Return-Path: <linux-arm-msm+bounces-84537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9BACA9E9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6287300D5E9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63AA25D1E6;
	Sat,  6 Dec 2025 02:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si7Qznv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zt2b+6zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C49F25BEE8
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987969; cv=none; b=Y66lmyOVi5zu10i9+SKdU5RId/DwzNwUEiwh4fiRAoik+f3lec43DLohH2tL3gh1wSVQToSY/1T0LcsJZKezUGQSbI5zvCXz+UZB+MUE6AZVK8qP12k7maG0xt4tuUYCfFsEu7UiX2CXmgARgqS+WHEgiAJGZktjccHliCK9HQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987969; c=relaxed/simple;
	bh=MqhGs1qxduKQSoiSkgcWKdSXZCg8mMlsDbdvtpgxxck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+WYf8EqGatkfLh2t95cU1haAG0waWG+E0Hvog+alenKrYTTxJgZ6B5ZbJbU0vfsC0ggb+FqOeMMq3fxWJ05XyzZHubqcO4JiP/QKmr0BHn2+QA06J+5RQpyc/Yl2K4hsMel2+oQvlwNlifXSaSP+VJFpXCxWjoJCZXyBpmzGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si7Qznv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zt2b+6zW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B62CXRM2704091
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kj+JkVLe4NHXA10M5x5aCfKh
	3mIUou1FJnLXKG7p8Ek=; b=Si7Qznv2D7rfwREYtPQv3XE60atmLc6PGs3y/+HB
	3IpCffcJjNqspgVQzHQ0SSxvMzecxqXYBsOSvnjiJCcg3meMk1olOTZrqWhJIM6N
	FM4JUJAIn1B2RPZrsldwV7Zu2g7v4ePLyAK3m45E8xvoMqFhQD903mnbhfm8WADI
	zNYAjYJhzbFumlUKeIVweSWpZGZMAalmd9l9psundBEzvrQttljmeT5EZWfv3PiT
	ebLmk5AOBsk8v2WSZ3g9ewInZcE0K++DJOuLVuQup2EQTeJl6O7MvaRzEQc6/8f4
	voO73guNq7vti0qgyV5lzmMd5r1EE9XBp79te/hJDXa1CA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga00nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:26:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so576689985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764987965; x=1765592765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kj+JkVLe4NHXA10M5x5aCfKh3mIUou1FJnLXKG7p8Ek=;
        b=Zt2b+6zWKQsNPx9xcg2D2/EFxvWBIzyVVmRHNUX+6droWzS9MnfU/k2Jwm5KDXMItv
         p97YyxPocDrKh1XUmouI+5yzdr2ek5g8FNnzeDTYAQGbz/kyX3+f35RSerNveBbsTJwE
         jODqqwFf1Ly7d/gq/Vj7UYjLtC0LSgOR4ckQCXM8YVEkXWK9cznTZrrczG3CWZz6wwR/
         ai9Eev6gYgwuzAKxaTal91EbJ7d85s7/mU//Ebr801A14KjHtY0AZ2/1njtVYxVNHtui
         UZ+88Ew6FkUCrBgHezIx8O0kTn3d3r8Y1J9U/8K6eB+L6rElCcYVl8HvR9/68Gzw48qv
         yzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987965; x=1765592765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj+JkVLe4NHXA10M5x5aCfKh3mIUou1FJnLXKG7p8Ek=;
        b=jn2/SP2Noyla3iKfRkO4RNbjBHu0Ild1V+tkx5ad+lfW6M7cwxc0GHwcmmLQTxjsOM
         YhUpgFEOvsXWEUQHianCtR4bwcRhWcVIzujdJS0s3qOtqmB5pRpjnuxrMFBr6qKiSEvD
         v7g1StW1mR9tX2aLrd/0btQ4EO8p+0vjMts2NM/l65eE1j1zmgPmXDO3x7dEQJrmiUAM
         /AahOq0XdgjZ7XkpsqRZn0kGz9VSFD0IfnY68XqHSAMwPxl/jvl1ydzr3AAlviwvKjq+
         aEg7zTqLTgCgX70JnKE2VwB/jzx8bNO/LqRY7YZnsOu9osTDeBvtbv9AjkFF7zV8fos4
         nFRg==
X-Forwarded-Encrypted: i=1; AJvYcCWAYLYcXixXDQpjWwObS2wqB334/ssPkat5Izlh8CNY55XsvB5ew3jDqqfve4cn8O+AQ1fOh+wyw0NYaEUL@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCD3HWZnqcdp78I2w1OBEoBDhLoXV2Z138p+Oq1MPeJYGxTn1
	PyPG1Z4YiJskzW7BHgmpyG7jHhAPQJZy/5Y+isIk4oeStVNvpEM6Co9e5g8yIrnKY+0NYmyUF6z
	SM9bd/bqdLd4I18MdwSXNlxz3bX7o0QRwflONlBS+/56dun0opD1mV/Zq8uKv64B84iAD
X-Gm-Gg: ASbGncutYs2tLZl3/RmXu3vCiBWn9JFCoBh8D6IiFu/nGxjalQQxAOGhJpspyCVb2I6
	ksFRz9mH5Q4NVNWx6+q3jr5y/X5BFXFpxjHNQ3m2xfF4C0tI2Swai73AydPL5zU0hS9F3fywjb6
	1diCDPJcnSzHgSfS/1G37BKuBNIAYtnECqBq64fv7QLlEKEZTbWpInBH+SW3FHy80ht3depxPhL
	6SSZF7NOeZArp0dGLmX2sTneo2jezZCivXKTn7pYO5a1KplonOss/YlJCIrAs2K5z30tuRWJcga
	LCHVIPOPC2D3uiJ64Y/xgaIfuMawG03Nhuu7rYObq+q2VIaS7Dq/Tl9qhTlbcTl3AmGDRS1ttei
	qFvc4Y6WgO3cx4Q10NQiPoGKybOR/OJQquMRH0Ov3z7pndW/oT8+oj16nfFK4h8Jplmm+mzCjrW
	LkyZ48sepbtxcMXUjngk5gm3A=
X-Received: by 2002:a05:620a:7107:b0:893:1c7:4b with SMTP id af79cd13be357-8b6a25369ebmr198284685a.31.1764987965371;
        Fri, 05 Dec 2025 18:26:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo47S/Ao1gsGym0DfLeSYhJEMj1JrY+A/SJJoulcUMV14qcvN7fbVZbhuq+l6aihmu+l/iMA==
X-Received: by 2002:a05:620a:7107:b0:893:1c7:4b with SMTP id af79cd13be357-8b6a25369ebmr198281785a.31.1764987964838;
        Fri, 05 Dec 2025 18:26:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595ff7sm18817431fa.30.2025.12.05.18.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:26:03 -0800 (PST)
Date: Sat, 6 Dec 2025 04:26:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6933943e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0jdaQYcEcLoElLJ8wKEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LkgVIumdqlfvHYAqshgMMJTeLfNNSc32
X-Proofpoint-ORIG-GUID: LkgVIumdqlfvHYAqshgMMJTeLfNNSc32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfXyCrVxFOi0rMZ
 sotpBCz6hUcGauy1YwaY/UDBnHjrk2XNBHaxKU7XL1xvG9oc+gLnqxfXAeUZlc3rWT6t9ILiO8I
 fClOX3w/FS76pDIrCE7jTBKaX5avPDd56WdkrNtnKx0axXClh2kGj57RVNJVP5OiVSTqSQ06Lol
 v2cNE5xP21uNK0SeoCw8fQFMxSiZBcxZ65wrDU0OjBCiI0eetPWvelJ5sQWg4jmfHLGm/6yQAPN
 ZUKWUGAaNTRS60xfTVan6OpDKLdAPNR5xIgIkuuzb97+NoDOPcrqG5L9WcwV3HHPRAOZFvCc6YN
 7QsHpzuY6YHWR6IBxS0chDJkesJcb4bdTlbE29oDmod2ahVeqkb1HQ993MTa6O7FSGfQrQVibdy
 Z/olde1ZuKXC58Ttt8XSHijPnqSPjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060017

On Tue, Dec 02, 2025 at 11:36:26AM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.

Please _start_ by describing the problem or the issue the patch is
trying to solve.

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 

-- 
With best wishes
Dmitry

