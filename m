Return-Path: <linux-arm-msm+bounces-78089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2500BF4B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 313F318C406E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 06:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B425F973;
	Tue, 21 Oct 2025 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9mGP4MH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729323BF80
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761028263; cv=none; b=Br1bqozSNPwxrydH6EM6i5Iu/+CO0Y4lI3i3qtJijb3Cgl+zJWEbOBUIz1Jv/DXcF+1934U60mJuOTdvg7TaVceWryqPHbxOxdMTZQiMkI+as6w615aCDVu9IORyfBZxo32PRoPnkLjXhBPs/278QOaKDpChUreDoXEVrt3RfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761028263; c=relaxed/simple;
	bh=Xn2v/XixXomU1lq1IhOn0xRQ39dUnTMlBPJKpTbUd7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiENJjUuM/V+mD/AH+LDcSYJQ3DY3rkVgSC8dtiuI8x9VoULnh3EnWvSYzPvmu41hAcQ0rOfxfpEwzPKkF7bpeX2s1S3FJ4fyaaZ4B7QYVIH/7dy0kaAv19DS/+JkbLZLL8kxQ+js3P7IKhlrg9pQDIla6iBpmyqhKJnhINuWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9mGP4MH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1jc4018763
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xn2v/XixXomU1lq1IhOn0xRQ39dUnTMlBPJKpTbUd7s=; b=A9mGP4MHhL32d08h
	6ZCxyXxoc/9UoSFbMim5VGrXcG0BGM5NxOgdGxHkMjcbHW5NByK2NcOm57Uc9krg
	xmBdb4tCkMCb1ZNVh5ridNHUfZ8b/PjgTjkTqo/P40KE7LyCR3vAVl5VHfbqtVFz
	n8tDAclmgL5+qUx5dybRFFQTDU9iTIxSmkeIyS3Ck/96goIJxATRmUnouTB3koPE
	cSOFmp1pDZlRk0yeraXhBgPW91bzMMnrop6/PvzrWjfy0nesjjcYlMPxBRehSOkA
	GJp5wnF/ZVpDMd48O/80Gk6TanZMp5icMpY9Ija6DJ925sjKM4cQ8/I6cMFOZzxk
	SZCuqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469f901-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:31:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-286a252bfbfso140306525ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 23:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028261; x=1761633061;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn2v/XixXomU1lq1IhOn0xRQ39dUnTMlBPJKpTbUd7s=;
        b=kKZbcuKEgzk+y3v3a175cXbQubgD0WLCwyaqLutUf+pxYNTRYhkWPuQTJc21KlRDGT
         s0jIVBD5WBTB4/vwV7OttoAm11cTbDQsT5kWzOUUYI8GGA3fkLMn3mp+qM5o3hhK9COU
         CmCtLX5cK4CY1l1Afj/biRXi+4tzMvb+LMydXthPaSHeJvKoM3WvwvS60Qj8Jcc/wdHW
         wQMK1Pp1XTtGC/Lve88zBR1fqfgvX9tyzUEyNIkVskH0Pt7mwkkIxkWDyt331kfTHEtz
         Cy1QKW4J3oaOvyEGIICWJgHjsdguKL4ptl8FvDIhjzHU77EUA/QqGleR/vqG63By4xHY
         iAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+q8jct2rS3vKipSv+KYwWqeYi19TSVobg9f0Eg0EdjLiG/Hby0coMJvxZCqviERKKX6mdRw5lTkWiOSbr@vger.kernel.org
X-Gm-Message-State: AOJu0YxozeDyQgF4phwKveQB8IgDWrDWPmk88Zp4l/S2rRiR0T24CYu6
	O86fhoHc2NtcIh3vjnR5TFXDtNL/2/5L4bzQNh3FF5L+dxhhmR+3FrlPabBY0cVPEylIDXElehV
	DeRdtbeGXdEytIe9PjkN3QnqxxnvYYKRIesNr27oZfhAL2Gvydq8TSywSwqu+ZdWytbJO
X-Gm-Gg: ASbGncuEtljLSqINt0Yr1bsdKRNyz7MjrHZ3XiZt/pnUw5FmyFmO7eDSsf5xOwPcRkc
	O4tP570512cGAO/v6OAD4hJ7WoWD4a+uTV9lfaUsXU+hdKpERiVDAMN0emRPa9LWdvpVXyRQgKk
	+o66wXCePpEymj9Nhz+KBBPH1mpdrRGDWk/rlx3EW9zRNJMBWm3EOIJ7ldmY04VnsnBkM0JHJkA
	HAW3kz626defGX7H9b3bW2yek4v2ktdkx2vNkbnC6nkyo0AkW8HaasD784IgcqejdyqwzEXPTsC
	iZxdRGbkWoA+SRc2ovmuhr0xMh8FB4wi8Q+3DJRDHJtUak7zv6ujvW1y+nU4WEMWNa8CHfC/utW
	daNTTYV9C7pixKX+8jQ8140h+YLJi
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr180399105ad.45.1761028260977;
        Mon, 20 Oct 2025 23:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7d1oD/icwL9tXF2A+vZkz2krk4s2ylMycm0mskHgpzBPJz6Z8WKXs/AtbHkwBz835xZyBMA==
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr180398585ad.45.1761028260502;
        Mon, 20 Oct 2025 23:31:00 -0700 (PDT)
Received: from cbsp-sz01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb573f97sm731028a91.1.2025.10.20.23.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:30:59 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: enable pwm rgb leds
Date: Tue, 21 Oct 2025 14:29:22 +0800
Message-ID: <ada950ed-7b51-4e62-93ff-550c427a73fa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cb973808-005e-4920-a35b-3f02a402a78b@oss.qualcomm.com>
References: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
 <cb973808-005e-4920-a35b-3f02a402a78b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id1
Fcc: imap://tingguo.cheng%40oss.qualcomm.com@imap.gmail.com/[Gmail]/Sent Mail
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ihSA6iuPHAL4PCJvecr4hMoejPHcXxLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX2xXXTdyj4ygO
 f4kBoxoXyCd9FuMM+CsAXfCdhwyphFuw0FepNWHSeI5xs70UyKhNHlkV8haIaxw65rbw47A+2P/
 uIbPn4LnN0ixfisDma8b2tFJ0VXOpwyAzTMzvJlzQlkdleG9CX3KsvTH/3+tiwkEfkjn1GdUrVp
 uyBZ80FGP5fP3l1vRTEWm99EHJXeKmG6nx1sW+clrnDRagR1SF2I27dZIRuKBV8yIy0ig+zPzL7
 kESnX9kaim5YFfaV/3jwzGC+cvPpLt9vbx5DO7MmDfCTKT31I127V9O4+egPz61cnayG/vW72IE
 AwtRaLdVg/5HTImbXcHPkmFxzqDuJnREB65b24G9kEPnrTkSvHfhuZRwLjyzzKSU1va1p9aEYOS
 T0WyiyjeeJKHyXU36Ef6AmBIvJc8GA==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f728a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tLeiS6LLZF2fRYzC2IMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ihSA6iuPHAL4PCJvecr4hMoejPHcXxLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

=0D
On 10/17/2025 4:09 PM, Konrad Dybcio wrote:=0D
> On 10/17/25 10:06 AM, Tingguo Cheng wrote:=0D
>> Add red, green and blue LED channels for the RGB device connected to=0D
>> PMC8380C PWM-LED pins.=0D
>>=0D
>> Signed-off-by: Tingguo Cheng<tingguo.cheng@oss.qualcomm.com>=0D
>> ---=0D
> Just to make sure, is this a "multicolor LED" consisting of 3 ones,=0D
> and *not* three LEDs that are supposed to communicate different=0D
> functions (i.e. network, power, disk i/o)?=0D
Yes, it's a multicolor LED composed of three individual LEDs within a =0D
single package=E2=80=94not three separate LEDs for different functions like=
 =0D
network, power, or disk I/O.=0D
However, there's one exception worth mentioning:=0D
The blue channel is connected to two sourcing signals=E2=80=94the EDL indic=
ator =0D
and the PMIC PWM-RGB blue LED=E2=80=94via two resistors. These resistors al=
low =0D
selection between the two sources.=0D
By default, the board is configured with the resistor soldered to =0D
connect the blue LED to the EDL indicator.=0D
To support software control, I=E2=80=99ve added the blue channel in the DTS=
, =0D
enabling the capability to light the blue LED from the software side.=0D
Some developers may choose to re-solder the resistor to connect the blue =0D
LED to the PMIC PWM-RGB output instead, depending on their hardware setup.=
=0D
> Konrad=0D

