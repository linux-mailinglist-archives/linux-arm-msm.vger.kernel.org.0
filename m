Return-Path: <linux-arm-msm+bounces-84555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA32ACAA050
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296CE311B32A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A787299924;
	Sat,  6 Dec 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6q9opW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPcRKH7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD81F12E0
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 04:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993722; cv=none; b=nVTzCiSp0DYWjm3zyxm/JIhnjKXC5ihiqur22G6SzCxYZbl3h5HKXoDdfQuZa1FUk4jmUwVGpBh1Wj6dlPisZzPLKYelpbi+YaXmn8k7908DxPuXzbNQ8zjjBC6/znm2jCl2B/a6JyaLI1jC5xlz5Sdx5yZ6oIMvn8KQ6dEISVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993722; c=relaxed/simple;
	bh=ANqLUbH8z5r1tNPCztXBr8i9cgZH6qe2CnSKUC8GKDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUfKbQ7kIHd2AV40paHwjv+/7t933ZOlL9lLxI/N9uyGJFJX5h2xzrkWxxjGjnNYAvfD4O/hwocpnDQWmfbuGhYp1Q7kkZgVTvVGfLwJgwLIyxdXRxsncVp33QfEai/+sIJKwhj5pJVY1HUxQIzjIwUwp7kAGNKTJJr2N2QPMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6q9opW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPcRKH7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B60JudI2209777
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 04:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/odArupX7GK6S+g23TdhpxBGWP5MA0F54bXiU7Q1EnQ=; b=O6q9opW9DDuaZgTA
	B6iErHbUcbAt1d9MMleORhDFZfAsFKJdy4vBLvJClW5q7WoU4b+2WxY+g5grmjb0
	sX2K7dHPkNO9+oJub2Xz+airH1hUORQMdbDE1yJyxc7yaUOGfmkpjenK+B5qsFgl
	+nz9WpMuX8NJfex4rxrQsxDUXdlii1l4RoU+0ZSO20OA3ztt340G8i/aIuThJsyt
	dAOGlBmrIvaePH4XF/X2Lvwn9+kQfzhisqAi2yqbdcJIFXw1Qy1A5Xg9/LpOBKfA
	otIaQCMK/9jYkNhNp+GXhoWNT15SJhdu7eoW9dgDlfzpjl5SAYJMTprrYGyqSfVM
	tELWlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9uprb6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 04:01:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso465719885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764993719; x=1765598519; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/odArupX7GK6S+g23TdhpxBGWP5MA0F54bXiU7Q1EnQ=;
        b=gPcRKH7gLL14S15bVJ9NBuu+580Yqy3jTsBBMCvMP5hWZ1WNxaniKvcLojyDkGhEQr
         QklxRaKnbuA8oHFb/IBrojXwqzjc+GET/W59HSX9a+tvRiZvthcRK0X67QgtyIkbc1SE
         TQmXRDIrq5knUlZtvrXbVYG/AyrHT7a6J4eXPIL+dbzYfwqUsd1CuPPqycR0XMAPO8uT
         Q7tnv5WGZyQ4Idk1BoCrCkpTBclo8L71e9/CgCuCRunx61TR29ubhwP7ioLPymBRxE2j
         9AYf2hKtbJREsjAURysLIUoIsADfJjtQNLOlqWGyzKWVzA3QQCnkKu3jMlKHlnyXfvce
         spHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993719; x=1765598519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/odArupX7GK6S+g23TdhpxBGWP5MA0F54bXiU7Q1EnQ=;
        b=gyNFOVlJiKBLaSF+gXoVBpeQ34cjSU6QmHDpz325yB+zJygpI6mZiuzdnV6uV3HNsm
         wLlrLSKk+9+trA8JedwwAjDbOy1E3IaRXNKMXuHi9eJOhdVLZTX6y9fGqGgjxJtLGKo5
         LebQq53VXq10WJJt7mJnDT4k3rDl0KAkBqVc5CgTiM5KPpcTMTIvppA7dWFgrrUVg1sB
         H4Q/v0+WjPPOv/suIQFtAP4qzU7T3oMQ5oJoxMvxOBDXcTg4yC2R0n/tGTYynCkIXDKp
         0a8F/RtuQBGNd+gaqNfnaiUgh0riKj4c12jzt+f5HIldLY6072XtY9VuJKuFG7KM99Vi
         OiWA==
X-Forwarded-Encrypted: i=1; AJvYcCWGzvVH42MNSBmfkVVMQN1TtiEhMu1TycDVewxtf/d66X7VQmN5ihkxm5ZPIov+FKFnNRUz0+s6WTwL/1sF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb8k6eXrIPYj/fn4kVBup9xfongGf80LaXXM/r9WbN2D/LihUu
	IcA4RgSXqVLcbdyEHN3+7oLCjZKaQMGS7ju/MmYDxtMzHjlt3HNRMdjGyv0KfnegLCFgQKxBlMZ
	C3ZYmbpXdAMKbor/7xrHVPjP4o4ycog/vWSr1jhSHdD1/EoNWzpJD66mm2DJh+cI2Ytm6
X-Gm-Gg: ASbGncsnPXE2o6FMkcijg/z26jr7ug+Y7iQLWNOuT2nJRkwNtvK6ITAVbaLMFz2pvdj
	wAI72+Jri6MQz1E/uTC5eUbBWcCyzmMDAdroT3HhwJTfF4OTxCN2AO2xCjsfbVKXWxZliKBhAh4
	VqhV+GZ7IuMXLQSv3e02GgeWRFJxkqbLD76ErS5sWg7N6zeytgnOVDJ/5p5GcrkceCA8BlT7yYT
	WCbOQ0xZ4JiNVM1/7t1ajyPDWfO+2ht2mIZVbL62tuAVPLVrntpYElAuXjOpHL02106AVnXNvWO
	YWpiHEAPAvBU8c9qrtINp6kmvNAdukMsJdn4bDtW6xqLD1EA3AI7gSHg1LBhVcAPiCjQYLz20I7
	DopVnmW47OOtRjPn8Y0t/FwLXI5Z/UVQwOsOvTvJNvdvwn1DAaJBwL0huU0m1CxfCztCMFJzaTg
	90JbLI/q3XdbmGC3prmAJ3ROk=
X-Received: by 2002:a05:620a:2908:b0:8b2:655e:52f0 with SMTP id af79cd13be357-8b6a24ff58emr202933385a.22.1764993719385;
        Fri, 05 Dec 2025 20:01:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGodC8/lR/0pK+PHahDj1wjZi8jBSn/5PwsixZBvUYHkBEBfH2wKQ2ceq4/qSHar0Y1YHz13Q==
X-Received: by 2002:a05:620a:2908:b0:8b2:655e:52f0 with SMTP id af79cd13be357-8b6a24ff58emr202930185a.22.1764993718818;
        Fri, 05 Dec 2025 20:01:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a63bsm2070906e87.1.2025.12.05.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:01:56 -0800 (PST)
Date: Sat, 6 Dec 2025 06:01:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Message-ID: <hku2xgecaz3bewsa5hqzqklzay2okurcrehzaxjkx6ktayinow@dtgvgowyzobj>
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <arocrbzcwvyb2te3gcujeo7jaiaisgh3wuketqkif7xvkvmbct@r26gqpw6gb43>
 <7c54fd46-d17a-4ee8-ad9f-e98546958dd5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c54fd46-d17a-4ee8-ad9f-e98546958dd5@gmail.com>
X-Proofpoint-GUID: 55lH3rDY43o3nafl7mKPWh9RYFczTQZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfX7hNJzQfu/nE7
 /FjF6kAHyQY6ZSGGJGbfAuJZhkdL4GYwuWr/SY3qB8bn60FMwqOk9IlWv6dC1VrYPf0igsiTDuN
 roDY8XGnR71omy8xkfqvw03EDgJG1E396sXBSNPL/OrAvw9vbcSZK5KSXxWP0FOoZ6Py8XW1iRG
 X0WIe8abYwgyYonFBl9kpqmIiE/y4g/jzvL4yO2+Q0R4yOn81Zcie3erCbzRLLwl2Gkt0K/y68i
 FlBkHFeL52uisgirmWv7oNyBk4wSQq0bMD+QIz1WjohmZpJiPsxAxmyNdGdMRwXRVcWM/D4FNvX
 JImAGl+pY9pn3m8cfvSDryNXErL/jatFYFqAFyp3BsPQOUQ+e1CX2zXXUHPuZMMNn4pKMMNQOSB
 QZVYpOdmFFrHZ9Yc3D1cYTrZ5PJZTA==
X-Proofpoint-ORIG-GUID: 55lH3rDY43o3nafl7mKPWh9RYFczTQZd
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=6933aab7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RKOAonYVq8CxiXVwL6QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060029

On Fri, Dec 05, 2025 at 07:54:55PM -0800, Rudraksha Gupta wrote:
> > > +		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > I don't have docs at hand, but it looks like these pins belong to
> > GSBI10. Have you tried using it directly?
> 
> This is the log when I use GSBI10:
> 
> samsung-expressatt:~$ dmesg | grep tm2
> [   79.555802] input: tm2-touchkey as
> /devices/platform/soc/1a200000.gsbi/1a280000.i2c/i2c-4/4-0020/input/input3
> [  110.242881] leds tm2-touchkey: Setting an LED's brightness failed (-110)
> [  167.074920] tm2-touchkey 4-0020: failed to read i2c data: -110
> [  182.435009] tm2-touchkey 4-0020: failed to read i2c data: -110
> 
> I could be doing something wrong, so here are the changes I made on top of
> this diff

I see, GSBI 10 uses pins 72 / 73 for I2C. Then this your patch is indeed
correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

