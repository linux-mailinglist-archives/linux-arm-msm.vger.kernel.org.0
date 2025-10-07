Return-Path: <linux-arm-msm+bounces-76184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB736BC0F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C60394E5C8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C98E2D7D35;
	Tue,  7 Oct 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcoTYRP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD44146585
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759831520; cv=none; b=Sz9sAilnxiHeD2AxmJ/LW7LC+3kYXoR9Zl2IAPslLbx8+xz9fvbhY9WBD6wgzGE2hCMcfpwFXpMsBzZ8nGgiHIZrUqkH/7Qa23AVhq+WOGe8cSzbmpc273ffu8HDmKNG4RYW/zo0gABWQ/Naa8oGy1VUHnYneWpbmf3bc4btfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759831520; c=relaxed/simple;
	bh=Sa9j8HUMO81oEGnNcP2btrssXKd5FBC/u7yBtwhyH2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXwld2WQSe4EcU6aTUVJMILHa2+fw6tzOvMEerDRS5jOQ9RznYTXIKmQfYuJ4tY+13NrWWjOdx5ANGcrzGhrmYV0XAabxmT4lnPP0qrJLK5bxxaT4OTMQ3NwV92QqSqB5Nat41TpJTzviHa/XM8rqS4sLijxjRq1XNOHeo5PiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcoTYRP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973bmJx004643
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=; b=fcoTYRP1OK9YZevg
	l1/7RmWvGeVOvMXsSXlPsp/VCJ/JzaYX2irH9DJFfbYJW6gPX9VqiP/3VoTSN9+P
	+f0dO5lkrt+05bGOdOuGCKJ/NCCekI4cnO7zKJkbaXQ8fxwoFSriXhqHaoPkNg+3
	hjwhzHhHgtZwfiadxt8c6Sdu4k9imTBXnLSA0I90IPAj0vAWNCsSamoLJOKuhwK/
	gh5/lfV/3ydQWiDXcjKJnj50ciIL+xVfpC42XHuPaC+EiX0IeMKq1kUF2+u97lp3
	7R+ox+24EUvHwVEqL8C3h7ttiyALkVFVLwQJ/8IoRS9z4Qs7mtwMOKB016tKjAHx
	DxLz4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn75a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:05:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb3bf6b2dso11255361cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831508; x=1760436308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=;
        b=taBjg61K+m8s4NtqhcUGYk78ejgof7Vp46ikcfemlyi7u1WEaXgVxRSMuo2VD3kSJZ
         8LpY8yOfNvrqYdxAYGc3lQtP9UIBd2xU7eNNRItUF6n618YRgmpZxoF0VVwXQy2wQgaK
         aGoMwn6MEPw5DUVGGIIalrG6AlUiKwZUAnyVAip3HOSnzR1UbjdOuGKV7aQBGhr7wbcn
         xODWmEqlnsSJWNlfupZ5Bm6TC7MrU4qt7eLwE7nG0pG60/jotO6QK6Y0+UEhF0ti2wwE
         3SDPvMLMrY3TfkNjypOtXVeCRYsDf04ZoXfaUXbGJ9V3qJAszTMG56CFKZJtx2P9pO0P
         J8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVQdT1LrEnMdw9SZnsxaAkZozc+o9nvc2iOgaYCPpVyalud1r+IpgLU303AVEtkL7FMtszD2lV+5VzBu12m@vger.kernel.org
X-Gm-Message-State: AOJu0YxszB03Zd86XNc4gy+NFYZYsU9KDEOWzystR+POlSYED9/zgeLJ
	i0pUcaK8lz0p5b29L/24W9vhMXo5RRNdj9b/htaXCulUZRjuOKcsn3g+l1yS3L23EkRFL32VuSD
	wdyGX/hf03ZsXbG90l8FAk/hRID9m2YssnSt6VLIwqeCFgwqpUpRrHPiMw9imhFJXPtCa
X-Gm-Gg: ASbGncu1b1wv63XSgLeiqFUhGL1v/7R1yKONp+sSVnJpU4Yx/X99Jkw0b4Vm0PIy+m7
	sRnrVNwtNlgu3yr83eZP1v0PVUyvnew3sutrwfKhWrzboL7zyEAds9xvGoFIvU6h4krj4VnbwTK
	q60hnhUFmfBSEnHq+A6xMAmZvDpoYU3pVprBt00m+QOviiEo6qymCcpFKFYepWAfIwLmLhlHmZD
	zWWp7ot3N+pB1moDYwnniY1CexWC0iSjz/+D2szqH9KOgEGNCOvB5czgMSAvSNdNISP/2X5ljH9
	SjRHO9x/YLHe249rsMXkpFtkm8Q1wgHhQCNKbM5zJ1MKw8HZVvWIwhnoThOjJwy+o0IbGphQbHc
	U5k4x+2wNzT+l6VN/8MFq2bvO/tY=
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135726351cf.7.1759831507896;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt4FfkRc47pl/KPYAeRhUqt4T2owkGAF15yiRG2vKpb73fM3SZHRYcq5Zqrgq4lOY0C0bgxQ==
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135725961cf.7.1759831507370;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1357227866b.49.2025.10.07.03.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:05:06 -0700 (PDT)
Message-ID: <f915951e-1604-4043-8ac6-49f9b123f478@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:05:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX2lB8Q7QCAjxs
 iUU2vDs/gExeIsdGvvnoaolmmuXMRgd7CYp/o1ITWMWM87gaOHN9DQbgyUz4Xh317I2N1Z/liql
 rP0zgIDRiXsW29f9SlxJHdNbqK+oI8IA/okm3/7+mjtAowTlb6CrZsIh+vEmCKbaTIUmzMp03Px
 F/r/LOthgDtIrjWRvYlt+sjw2ZPhW8YgMNDz9sijNrOeAWMX4rkUAKQrrccwBc3fNjJ+9m8ON4P
 upR3Tr2Rm6Xd7sNgXukH/vNds2uGScFmPbZQlaB37sE6NVg9IScZ/17sMXa+KYgUNjn1miJyqRH
 PoD6xXtx+zUvJ53y/eT55yYA57HGDXwBC3SZL7SMXBlM7c1d4AEaSn1IvmwCdKPzmgBjRQfbG5m
 VQWfDkNH0vGCczduOmwCqLISlC46rw==
X-Proofpoint-GUID: 6m10rOclnk5biVfQCKdiFZOA4RxsYf6Q
X-Proofpoint-ORIG-GUID: 6m10rOclnk5biVfQCKdiFZOA4RxsYf6Q
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4e5dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8
 a=0uX5jv6YKbm2qIkYBgAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the required pin configuration to enable Bluetooth.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

