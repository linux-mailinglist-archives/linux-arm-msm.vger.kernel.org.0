Return-Path: <linux-arm-msm+bounces-72827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE5B500C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6882D1C624BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB82434F483;
	Tue,  9 Sep 2025 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJLJCZ4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453C334718
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430827; cv=none; b=o+ExMWVODq4RCBDWOqnijXIhJYPa4+hxXOJkidsGM/T/8DtOgrJ6wR1i5CVyuyR2eI14Guk9HYURX0BouFW7BZiqmLZAXQRGdrCzw/ZiBxQ+9iuSmxY/8ir/wU1N8Z7BULftzcFcFV2JZQu0yFEcAmuIltBNRexLaqjOanob+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430827; c=relaxed/simple;
	bh=tBUZulCM1QmYag/rYO1gJeRa4CPakZQb8P0yx0qaPpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3efq4d7MZvN1epcIzDA7Aa0/Wzcf1ZuHQWyyW3BoDUUygpf51wsstkliN4qQgbajreUs+eDvXD9lXNjNywDIbc2qSMrwfrNhw6YHyLxd8pKA3kcxs7F7rJf7ES43K83ZuNIbhZ1kBciiFvqtIJb8ZLvScOrH6jVGUXtJAquwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJLJCZ4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LeiR004152
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 15:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBUZulCM1QmYag/rYO1gJeRa4CPakZQb8P0yx0qaPpA=; b=QJLJCZ4sqDs8saa3
	NEDg0HB7QVplC5FmWvBH0bQt5bRe+DCYWaEfZ1r/Yf8fIn4sNeH07nWf5MgyM160
	CMVE2YkCCRWAX/7IPf74A86bR2YBFfARvlCRKrMZz/KWKTJDiKa+YqhcgFNOVA3I
	PA917cbbFFdqopTiN8r3Y/CkZ0DaXnGOZvAHn6dRYkpvPqqM3z+hQ65e+eSozMd3
	7y8EBrF4XkLPkJNazcnkl94rsrYosmiY+NEPCcLFf/fY3NetQsXkvLmcbhRe2K7x
	qHDtOONgnkncLJKwUQb3ixwAssSRxVUsqkhofCZbThx+U2izRUXMtmJoX12jmkeu
	KTJgUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgxp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 15:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7fff4abc97cso1466453785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430824; x=1758035624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBUZulCM1QmYag/rYO1gJeRa4CPakZQb8P0yx0qaPpA=;
        b=QJi0hw1XWUjXYpznkv6Ol85E+qz/CyGSv8knvBS3MdViMLPo5UapY3BqVSvLD0Tk9G
         en7WCuLtetilcuyGUsbukjktWCw/iv2+8lM1IYMUJzm3LC7U9IlWB1hW56R45oo8h3b5
         YmPRz+852PxN7RLMYlFw189FrincyEW/Pwbt2CG0x7nNyliZ4zt+LFd2zZiUt6QNQ7pM
         EzE/XqbdppWtHlO7Kd88Fu01xwRfw4Yspt3TagILt1uRbjf+EQ0gvBr13t9mJupsqYYv
         VBXw4lEe9DTSFKNAoMvWTq6vSdicAexUonS//C5RAYhc2JimHK365Hmb7LQlPbGPwUSc
         vxDg==
X-Forwarded-Encrypted: i=1; AJvYcCV3fvOyOl51wzOy5J0uPqNzWXQcWYc8rrJ89pArKdVKG8FfrRI7IbV05ePnIbHNiafhIvyIfUvr999dU4+L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86XKqCS4x30s1TBRcWkdlnv0GOw6elzwtC038F+pOq4o2wavv
	IFUZ6rAY0pbIt2GDYiX3TnCy5/ZdE3ILEEPAp3oktgdzg5K3/p7A5CewUP4H1SP1qQVmfvq4YPQ
	rx+y5tLatBu3+du9ubersSN2QRcAjWZ86dyqzzrWRqOxDGI4GwTrvWrSjRtC8WM3nMYyClMRxEY
	cjGkm59iJ8Z0A4obwS9kbwpQBiDON6sIs2iA6DLgIbaLE=
X-Gm-Gg: ASbGncu3UmfEQn4mTqGHOaGqYNvqZklPsSOPG4UIdz1UHGjVXR4vklE+qRSP7Uz9PnE
	cu7QUVhonKFx5DYc23kMz09QsXK6GTHHAlhcdCMRZgGWhH7RCbxhkJbPkQXzfHxJkpp/laKB+bv
	hPmsdxYK/httRmim0050XW0A==
X-Received: by 2002:a05:620a:1914:b0:80e:ea60:5ab5 with SMTP id af79cd13be357-813bdf6573cmr1065329385a.5.1757430824258;
        Tue, 09 Sep 2025 08:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP3m8TQXurtP7EDNoZFjviZYeRLBktqofFy6NzKQ58AmpuPf7TH8c5DGH/g48atlE9EDXdL4RKC+aicughQAs=
X-Received: by 2002:a05:620a:1914:b0:80e:ea60:5ab5 with SMTP id
 af79cd13be357-813bdf6573cmr1065323685a.5.1757430823532; Tue, 09 Sep 2025
 08:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com> <4bldj7jjsi4o2wz4wij2ggog4no2nndavk4r7frvd6fv5fjtfn@4unsvlv2mdl7>
In-Reply-To: <4bldj7jjsi4o2wz4wij2ggog4no2nndavk4r7frvd6fv5fjtfn@4unsvlv2mdl7>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 17:13:32 +0200
X-Gm-Features: Ac12FXzTNyQG9gZZK-bmNMKPyGvG8QLL-KjBIb-H6FUgWO4cQO4LwfZ749ugKXs
Message-ID: <CAFEp6-1naKYksWBSeAFSPeWvsaZXYxsMvXrGN6R4bJZNMzsiYQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
To: andi.shyti@kernel.org
Cc: rfoss@kernel.org, Bjorn Andersson <andersson@kernel.org>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c04429 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KBZmAnGqXSic2IO25hUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: w3V4V_0PrRe9IHPj2lncOBDggZUEzWsz
X-Proofpoint-ORIG-GUID: w3V4V_0PrRe9IHPj2lncOBDggZUEzWsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXyvAmXKygHcm1
 uJB0k1ExR31GNYQl1FMVFp57htCbHCGNougdwGAcInxCdeHqEeF1HHP41Yc4MAfmytj3qfROlSN
 UOMw2WGUgOfF/ygD6zWiI1jQpVzmNhzelxPZlw6sCrFw5TugM2+LPwtmGEbAd9F4oS9c8hq2+ZF
 kQfcFTp1q3Rm79Nmb6uB4zYciDtHgEzet9dgWqZcWuZDtdE8o1xyzlmMROXnqZ79DWwSRKOgKVU
 RNFkIp7yLVWCR7QFjRtzOzreMRXpJkcnxuJlupDEgBK1KpJJe5eBvciGh7GGr5AMAFCNs5KekiY
 ygASYoWmUIarWfVYFbaLjzkGC24YFLvWlTKhzmxPvJPEGAHUA3y63KBjfcXTLkPz/nJYZi29V/b
 w4W7fNIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Hi Andi,

On Mon, Aug 11, 2025 at 9:46=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, May 19, 2025 at 11:47:44AM +0200, Loic Poulain wrote:
> > The CCI on QCM2290 is the interface for controlling camera sensor over =
I2C.
> > It requires only two clocks.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>
> Andi, can you please pick this binding, so I can pick the dts change?

This patch is reported as NOT APPLICABLE in patchwork, should I resend
the series?

