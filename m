Return-Path: <linux-arm-msm+bounces-84714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C9CAE319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 22:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B7D3014597
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 21:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3732DD60E;
	Mon,  8 Dec 2025 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVTdQFX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fny7tMeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905A21423C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228289; cv=none; b=FbM7rYdoW1jeSCIEQ8ZzswF6rhKyoQEzHL4A+GcEZ1sMHtL3IdDsut9exAxu7DVlwMEwjeX+CoOh65gLbWzYUfDxMMJrV70Vomu1LGtDg5hL/xTbCnepO/fOotA0Oo7CBYdijw/6uuBwDLo5Fttzv9Z1VWmyGdr5UukWCBpjkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228289; c=relaxed/simple;
	bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPFSXFrEnaMzWp8Mw+ENHB+pv1BkBWbXGLvD6rEZACgNfw1ppMiXMmArKnKFqyGPv1ctpuKbLGMfA1bQyML/stdxDB3KRX9YY+sqMp/lJN0PHNOyDcUdabVr3EQR/UntmFftSqDQrTfOVE+oVLs6+9LoI1GxYzeCqzX+uWlgP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVTdQFX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fny7tMeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8H4RNO1610801
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=; b=OVTdQFX1B1+44LT2
	Xq4tOMwGqu6pdaeFPBFGjVIWthPcpLRQQA++O0Dhdc127rrBDi2Aa+janhH3oDdX
	VOg1zoCTcV+hzY5h1f5BTr9y0TtDgFRkk8qj5D5/unS4SKM51zS9xPCE9Nfz1eEF
	5ZAerUtga1ZbHGY7BpCUnddJv8blarQCzWWFIvJSrgRs9BgAQH1Xv8iUqSBQZu3s
	fA6IopPu4bXK/7tqUznSfE0xkEv1MaqYegq0wyTL3zByknwRfgPgVTU9D+2cgSOq
	v5WJouM6XPa/g/H8efQFOurp3nWUEivqfzid7QhEy4tIozxPze/sK5dqH+BiYVlp
	1pub5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax2rf0nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:11:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b19a112b75so607105185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 13:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765228287; x=1765833087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
        b=Fny7tMeb/0b/bif5/UtWGATNW8ms8HF6HVpjq4liw+zpewtVG/SGX6OkNfYl3cSkBZ
         q+V/102Xm53W7EXtDr5jY2FKWZLlmUOEbC8c8KVSQL5ohrqj5qZk8LKhiDER4XF0XliA
         ynLGgEVNpNfZRVeo2s1RNyvX5n9Kty1d4stFyqxZHKvLixmkR6wxuLKOb7a5bN9DmlcC
         WN5nARzX9E+1NBL60QmblMJpH0d+PDTx1WAuiLjAAJJzTJIUI7yRTHKMeJ/Vy4vR9cDv
         /fmIc6xVA9pYLmLYbR0HP9rqhYNL2Ncj+Q7t1HxKq7G9Cb+RBaBCj0A+eIazpf+e+ogS
         qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228287; x=1765833087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9bk/cws1AiAbG14aJY0PQmg/AfNPSGHyIN/r9iphT0=;
        b=D58cdtxyMdQCEF9oYOSJUoeZ+o2S1LQUu09GQTMzazFw/lfiO6sIxknsGDHNhMIo7I
         Src8MyybbF5ERDnpghRY93sA2GL8G9w76D35GtXZ27LWkBZ0YLXLeSc60KLVoUNK7vSW
         OAfK1QW7MGB7LkhUxzyVzp4NCm52uRWw4Cglbj8DekkYQ2eP8rAXojAXuHs7a5I2UGJo
         qEavHvBDX4BNRhBOKb83vZMpS3KDzRduK4cJnGy33PXzTblNPImzqCRxNIUruPnM4/l/
         quswmFsGRRm9J/1nlQ7czeSilAB2BWBIYBcTLsRzg4kcqo5rsUFsbX/CGRSP8CryigVg
         mg/A==
X-Forwarded-Encrypted: i=1; AJvYcCXkG/pBQhj93SzQOZCFvIjLhjeWe8y3HJH9axAxirQKusZxVBkcSKkb3gJfFOeDBhhQnH9UjK99AhTiW0ij@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgrOQ1eacBCOVPgTZrFXz7tX6JIpjoUkXs812M44c5ujkrl05
	lBxLFeo+OzjADWRVOFiPPeYGkSWBaCY9xkFLeEjdTPJWSplLjUTQIU9nJmsfmUrBXJi3sn86ly9
	cd/tbKnOIKWX0jsBTFCdC/0BZW5nCaREBLJfFoSi2mxHXGCMIOzAPmawGqhp3dEfuhS5OKVZTcI
	RgWoMThAkYpwO7ob8+T5mxc8IHei87loheAPTEChR/CII=
X-Gm-Gg: ASbGncuZO5oxPJRCpl8kOjAAnq+Yj9GPWRko9VdYEcU13rDPAKIqpHUfpR2R2gRkLN6
	4EsSlM7DA6EjX3iXoxrdNopVWrWy3xbOfWolKlGmaymz1UY8pCCvjldUrsMyjSdVQ5NG0eNlbwp
	i2azFHlCQbtlObLs7s/K0au/JQt/GYOL/DbyG8WbeI5dhGqc5psvMR7GUMiksomgscnblWifVp9
	7j7s82RcQvm0JgwuA7rlGTfro7+
X-Received: by 2002:a05:622a:144b:b0:4ee:2984:7d93 with SMTP id d75a77b69052e-4f03fd967dcmr122397001cf.17.1765228286637;
        Mon, 08 Dec 2025 13:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF261ZBWZ0MO8U4blkfknNwiN5rJkPnmbFQFEwoCicRlq7tsjeLC4FnE8/xVvPZ2W042wDuY3pZBTBaNzp3D48=
X-Received: by 2002:a05:622a:144b:b0:4ee:2984:7d93 with SMTP id
 d75a77b69052e-4f03fd967dcmr122396641cf.17.1765228286270; Mon, 08 Dec 2025
 13:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com> <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
In-Reply-To: <o7i53tr4glcpahvinghklmltbeepqdpye47bfcwd32tltp36jp@nhnedmhdtnmv>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 22:11:15 +0100
X-Gm-Features: AQt7F2qLBOfEByKyRMYYc2kNjCVuFu1DL5YYVws91VLkM-B9oDA1PSu9hGZm5Aw
Message-ID: <CAFEp6-163xQ06zZ-+QsyL_EqV6yFve0bRxZNTHuJpBxzfVMoWA@mail.gmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ee0wvrEH c=1 sm=1 tr=0 ts=69373eff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uCX18gEAPB5gAkYnCOgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: chtswLIpzM19qOOqRCvxhT-KxcZFEb2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4MCBTYWx0ZWRfX3mUe7V1tBf46
 kGnpcL+LsPs5vdbB7HldByIlOW6VRFvMYWzPFKuj10WCoh+zUKfIlVOSiJ/4JyFrpnq8b0LKCjp
 Rbk8DIihXze0axDDLryGNb2NBzVYXF8iU7nxz9pYNYPxXW3xhTK5OIHm9wgIyz3jQEvKK2q2L2R
 mBB+IVBa78yJ1KMVqObm/nWByafHKy+uMkEs+L37JVMY8XqjEO9RAGkSclIrXQI8SPg6122o/YH
 P1f4tJpxcgPzTFeRfTQbaVxqMhbAXQQ7rXN+x1sqwGgwM4ns6UJF1/2m/kGP0/ThHQglv7JtZYh
 p+7y1RADvKilWYtJLHD25nz9b6PBypUWRLFCHH7aK5W005n00/S+hTe7+s13eIts2d6VuoK2if7
 5jerWY59ciVe+YkILk6P4blVAf0BJg==
X-Proofpoint-ORIG-GUID: chtswLIpzM19qOOqRCvxhT-KxcZFEb2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080180

On Sat, Dec 6, 2025 at 4:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Dec 04, 2025 at 10:03:25AM +0100, Loic Poulain wrote:
> > The CSID driver has some unused variables and function parameters
> > that are no longer needed (due to refactoring). This patch cleans
>
> See Documentation/process/submitting-patches.rst, "This patch"

Thanks, will fix.

Loic

