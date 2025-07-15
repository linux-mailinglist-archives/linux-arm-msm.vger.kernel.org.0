Return-Path: <linux-arm-msm+bounces-65101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11434B06878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 23:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4294C1AA1F77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DFF2C08C0;
	Tue, 15 Jul 2025 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpfILPCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F4E2BFC9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752614493; cv=none; b=Sl2llD0iehD+iPdSn0kLC9QgQrQhvqn1L0V6a1RpnF3/zVf3Dl1XNe8ztXjqJh66xKqITj5JlwY5ETSDIIDI0z9D1YI+TwZtwTPyKqVXBPHhxsByOsXyEV8Vutif7i7cUtbYrWE4+NdkH96gtV79ucJZZhmNJnY3+R1ZcEF8qSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752614493; c=relaxed/simple;
	bh=M54e0/ZlEEa2sNV99+CGjmRYbJUwlKNDtK0njJtoxjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VajmryLRZmyeok/ebcUfgLt3tIeA9pCL36klyZpgBImxmYqLbtYNZbs8oWq4kKfR8mN9DBMETk1wymlhQPAE3GSdKpQVDfmQRDIk5IMM6YV1gemIOPXeaQnUPRiEEvZ/k+UqpnTGXbWIuAmgBHHQvJcXUGnO62U6HBS2zmZk1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpfILPCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDNLk029586
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 21:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wt6pHEnPgOMDtsvi/12SpMFQ
	uNhk9sWrVUUSDWC7ddc=; b=JpfILPCq6ysjgrUDKdpIOioRmg3rMyF0SEy+bnD5
	iackY1+USjZDifvl2zdbwfFSE9EALG+KcOiiL8iNqFaSHLf/DcU/aVyWbEft8qYr
	l5S2/kt2JgudNnUXWgAmvUQLGkXlvyNA5aTWF6vmJT9NAlnzKD/VsCMNReWG6Asl
	NwL5wvtV7q6Ikpoe77z+aZbO7lmIJf10ELXud7QXnF16jOSkjig9TF/Mvv4p7XPw
	LjYmmcLIJwExnC0fmYylCOjCGstJD3FjIkBdNE5xMeqG5hZ/+jo1CRqovvIgUSGg
	JpXMh5+QMb7FaheXg9GSjLN7Q9iZweZBL5/5aOhYMzW6AQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb1pua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 21:21:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34fa832869so170834a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 14:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752614490; x=1753219290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wt6pHEnPgOMDtsvi/12SpMFQuNhk9sWrVUUSDWC7ddc=;
        b=L5T1eqidPZGj6AcDqYL8HCcoX+gCgGlkq6EFWFlU7kyoRkNtx5xvRWjpK366mj2Wkz
         vg5WsWDGoQi7LWuUb9se1bZPcQIugE9svWcXfDJGSDw4AICXZCJqvn93IgxGXSOhhNRf
         6LSFWvw13nXtzo7Lu1XoNulUiB57skakeuFhZIvUKCj2FG30TZgP0sXkRDXwEBk56OiR
         6CiuMp4ts2NQsHjOnOKSr29+8j8oFZUx8VTmBDZSXvneiUogZyWHhMhQxIIY8c8iWSqx
         aHJCQ9b0TMWXddw1lmvKl6zPMBOYcYKURvljanDvMzSZK6/6b9Bc4thnTNoTiqqGZ1u9
         +DrA==
X-Forwarded-Encrypted: i=1; AJvYcCWscxsER8aR+BbBNd8tD81ar2tRPzWzKNeqV/TLrDnUVeRSN6XPUO5CeUTDtPVt51bLjr8+QGnGr701sIuW@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLbcJaerGHwnGYPNzKMiVJnXTAhd6sHh0yG1bYMVUFQO05qdh
	91CP1e0puWwyDZHUjYUHEjWjHZuK2Otj8d4REkUzl2h74+McBftn/IqDWmPGW7WDrv7/+0biUtJ
	898Ulxdil6S7mDrBhMi+Xbk+aPDpnY2WSFdcaS22k+F8R27c4DX4LpOYvG60vCTd99v2/J6IPic
	jvK3W0yYVBdqWKmqn07ptMqtmuf0WbW7i/giC8a1hnSIY=
X-Gm-Gg: ASbGncvcrZv811n3+wxiygInQgqspqHlHxsLYrY2Gkgpd3zqMTXJF88g53wiPwSyurQ
	SbxTkChkFPkybqnCjHH4uiueZaUmL4ZQ4d/qBng/6s6WYLOy/zlzhmGQKkWmuDt5LwWZfBtkLad
	3WTBsy4VIn+QaDbH7vSA==
X-Received: by 2002:a17:90b:582c:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-31c9e5d6787mr1112815a91.0.1752614489632;
        Tue, 15 Jul 2025 14:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE180B/nvub/VcLFKHUYlMuFfM+d+W1Yrk+Dl1vV6BZLqXAgmjk5x3JRwv1+EXCWv36y+/9gQXCwKTEXZuI6Tc=
X-Received: by 2002:a17:90b:582c:b0:302:fc48:4f0a with SMTP id
 98e67ed59e1d1-31c9e5d6787mr1112777a91.0.1752614489066; Tue, 15 Jul 2025
 14:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715185636.21758-1-me@adomerle.pw> <uvw7usijkllom6cox4fkhrxpckqf7gk65b4hn244hpmj62utyt@zlbxwwmj5t6u>
 <493da354-2c86-452b-b343-c9ecd3ff84e3@adomerle.pw>
In-Reply-To: <493da354-2c86-452b-b343-c9ecd3ff84e3@adomerle.pw>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 00:21:16 +0300
X-Gm-Features: Ac12FXwf4NBb2pWO6jqWH2XiOZVWEfDSrstKZQZ91qjRKAV9iJ1Qy-M0e_EZPFs
Message-ID: <CAO9ioeUtiYFLyTWHYdoy6P69jg77EbPv-f=i2dO=9dDB-UaHLQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent hardware
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: HAMuAaJt1YF-xc8ZCVXiuHgm2GXnW6bs
X-Proofpoint-ORIG-GUID: HAMuAaJt1YF-xc8ZCVXiuHgm2GXnW6bs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5NyBTYWx0ZWRfXzlJJONUZOTT5
 OpdNmV8lnSDaO0sizGjukoLlHsAvJBnyw0gWdeldO1B81NcbF7h8cvO8BBmUqOy2L9v+pkwa1Em
 g0G3QNRAkpbWex1I8HUTfEQX7G3AifdbNLgprpCFyRu+5BtJuXQKL9r154KKubVFVFde9UgL//p
 iWL023Pg8YEMxIGxHeLUcAddBLNN3l1XhiUDpt0/p4HWjVMmSTcNbb8dAMy4zS54v634L+7yrvT
 W+xE13GHfEAk2aM8O9xleixJsFIEyAWEZ1bZMVxdE8JWf9cdkjOkpGz6YQf0SfVbC3XJj22XTwo
 rSNsPt4vs86iD+0yRIdtb1ws4M7hSpKZXwVWEwkpeyBaM2mE5bRWdTtPZkHagcProkJ+rFDsxvP
 fpweDL2312lGaIiEVwOIkwkKXXkjnf8wokXpQ+oc5h7QS0XUMB3GIs5Fw8YeMNupHwn1vl5+
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6876c65b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=9pW74NbYAAAA:8 a=mk2d8uPtwDXq42qNKiMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=67o8LzlnqLyy2xoPAWJp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150197

On Tue, 15 Jul 2025 at 22:37, Arseniy Velikanov <me@adomerle.pw> wrote:
>
>
> On 15.07.2025 23:22, Dmitry Baryshkov wrote:
> > On Tue, Jul 15, 2025 at 10:56:36PM +0400, Arseniy Velikanov wrote:
> >> PM8009 was erroneously added since this device doesn't actually have it.
> >> It triggers a big critical error at boot, so we're drop it.
> > Might it be that there are different SKUs?
> Well, while it's in dts, but it was disabled in the kernel config:
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/pipa-t-oss/arch/arm64/configs/vendor/pipa_user_defconfig#L413
>
> Maybe they just forgot to remove it from dts (I still don't understand
> why it is displayed in i2cdetect though).

For PMIC you can check in
/sys/kernel/debug/soc/qcom_socinfo/pmic_model_array. For FG it's not
possible.

> >
> >> Also it looks like the fuel gauge is not connected to the battery,
> >> it reports nonsense info. Downstream kernel uses pmic fg.
> > Separate commit, please.
> >
> >> PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
> >> so I combined it into one.
> >>
> >> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
> >>
> >> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> > Please remove empty line between tags (i.e. between Fixes and SoB).
> >
> >> ---
> >>   .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
> >>   1 file changed, 5 insertions(+), 90 deletions(-)
> >>
> >
> ---
> Kind regards,
> Arseniy.
>


-- 
With best wishes
Dmitry

