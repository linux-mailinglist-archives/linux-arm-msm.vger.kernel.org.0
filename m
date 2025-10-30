Return-Path: <linux-arm-msm+bounces-79639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D59C1F708
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C8344EC96C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C816E340DA0;
	Thu, 30 Oct 2025 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCRCoZgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hy/Ad1X4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFD338918
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818515; cv=none; b=iFWZMWfS3oXa2Ai2fKJUPVinIJBC4S3UL7WCBPiTYU0bHdRsf8XCrLAkH3MIjtBqLnyi0UA5q/bTxVHcHEdO8V8Y1mCLH0W0sNdjs3eevMukeN7nFWAJmfqn+BzS++8DaHJ2rUxu6ODRN6fGPWB0Ron/+akz/FgKGpB2h39E4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818515; c=relaxed/simple;
	bh=dXTC3SLxzp5wKcJKxLFNRweVNbKkU4TNi6Ad5nvL8nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuPcR3zi+/qmt4zCm/u1zDCov2+05ozmKqKXbZQ85cT9ptPzDZIrtYIK0MsYVFk65mLbI6yj6onqh8iWnQaJ09HSHKeIaEUvOtZSKIPIOo0GA3LWo1blKO5Y8LZNPj+15mF4P0LGGWYTujqC3/ed4W4PUOkaBwr9oFd2Xe5uqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCRCoZgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hy/Ad1X4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9MUsi3115499
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=; b=RCRCoZgA56ns6yDd
	+yKBRhyBmEiRgH/A3pfEKSzWFhIR04h7Iz2FBrAGKfLc8PNTcxkcTOvIzbApPQnO
	zDTib+W4cS1qTj+QOlhY2vSJ3etZp+sTAEwLusnkHsPrzHDq4O1Z/pYMi79ythDq
	HtT/tGGuL+gK8LCKQW8g0luvCNoG+3ZxzKX1JCixIYksRw0511e+nmCkoUINzVe0
	fj/cqmy6hR+2cS7ZV1/an2juZI/oX1duW9iPspKJtHEbpHz18dmNN87yFf3SzUw2
	784rl2kTyWAGr9bq6ouvOMZgCqbnb8Kt/QF1esQkIyl0JK3hzK5uh+va+rxWJjwA
	qDOypA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b404w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:01:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8800dd3de99so2233306d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761818512; x=1762423312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
        b=hy/Ad1X4S9hsy6BorcZQAirjpATjozR2dVkjeDfnyheHjgSVKRiq3VcHjHvahYZNCi
         VW9fz7Uilj0gGCCZeeYNIeuMcxuOCqkK0N8BSXJM8A5zFQYkXNmtqjSQALQRQb8Qs0bR
         Dy5u2lGjXGexfHF9jOa+/mgeNui3IhaEtHW/mu5Nu8pOrPRaQ6Yr0mkeDa4Gte/7gAdW
         ejUIvdje7Es0AZVLrfQSlbDE1u2lpRjgKiwKmwA8mlvZGgqW+e7P4+PhZ+d1ZCaJfpJe
         aKI1d+MVvJSCnoOTkZhwOBEmR0yV6f1hGqizbm8Y+uP10mFliso6y8FfxOf/AXXm6xxa
         cJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818512; x=1762423312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
        b=iv5tQ+wvO3ZOMBzB4Ol5VV4C84llzNYjZL/RHaO4rmwVGVf6yN6S7kxQ7Nt9Lq+iWW
         LfRw+RJ07q4lte+MYEbZk3AdP0wU5byrhvzWNskqs2bGcoJjeXawpK2bLt7sVQzwWtj9
         ao4209E1CJINaR7PirRY7f5TLeDC61ZzieUnnfOo19/la+Wj113HlPDg4YiTDOUqFxiy
         QEJfpXXS//6R3jPGhTsOugLk4281fbPZGcO/8rkbdEb6OGVgzaiWqjpOfakiqwzPA6bz
         qkpvkN2cAOGZwA09GU761wc5S3IlrLQzD2f1WTt2AOqU255/GiX/HvO1yOhoKc9E6/QF
         RZSw==
X-Forwarded-Encrypted: i=1; AJvYcCXJgoPUd6pQKU041y87cn+THKfFf/755OgTspAjSiciXE0Sl9RKmJxSBHus4a2f65WnU7YeTL7nB0RBH8ZH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNU9yd70+LwIsCSfpnNhSTdJVRH51cjV4lLaevz0Yh3yZAA8d
	SCAHuma5joUfRps4BFMTk7ais6i4QRf9TmKj3SZz9IW4aK+tL1E1/xp3r1AZWVpIrHrkxfAvl5k
	X2d5N6oPaCQONbyu4R7g3qc88vYZzfLKS7TatXY/Rn3N1t7aHkB9NocZ4X647X6+Ge2w3
X-Gm-Gg: ASbGncsroEgwrjorl+boLiSqj5dSdeiQwu8ltbQOxuYbwk8E7O1kRAg7TTcqO4o8I0B
	Z4N136PBlwA/jzTshJUKENBWGMaHQ+byvkiGgh83DhJLRqgebatbeukzLwF7+2irl12g8vO2tlR
	OKwy4UAIvLMXiESgjOs4F69CRPI3TnrDuLNpDodkICLgdFWLvJTi3Rf7qeINhrTBCBcmkvooy/s
	RbnqnLw4Ww7ZtIJQkYehVvMIhlOu+7dF1qg0pJ+X+X397gL+T+Nc0lkUMrRM1u9lZJMnhkbUvpj
	Dq0GlpsG4iGLWbP55a9VD0+AGhLt/ta8yKFgwtFcK5WYSI694RE+VszGZdATaOH/qyzW7eHzhCp
	/WkYPNzfvYLXM/NN8AkSGGoazyGbV5AxFQKw1CRYvEia1uBxDJcuJxXG9
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed15c0e8f8mr55333681cf.9.1761818512166;
        Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRkwzCLPCxSVHJgMpfb+sSifTWDoxG9G5XDKheZ5CxBk6Vcn9HesLaF6FBOsZzqqrVE4rY6g==
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed15c0e8f8mr55333381cf.9.1761818511580;
        Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7058770e28sm164872366b.13.2025.10.30.03.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Message-ID: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MSBTYWx0ZWRfX9nyd3Kxgwn6t
 JCNUe1OktM5KzTfpn+49CT4mkVQ2o4V6pdg0HFkhoxuexU5DVAXgV29jj5NPKQZGG/1HuPd1/1x
 bu0IJZXZjEctE/zszjp7e8YLw+A1HjFzT4tay0+qpnDlbGwyYTovKHJJk1rRECgX+O0fkJ5YpiM
 sOFuv/d/PbAi4vX6Oe0LSUfb9DGsbp+I3Sy31srODg8fSLfQgqP6dL+0H7PRGXGVQKVWC8vuggl
 S9f44+JNyWZyToMqAbMkiIbCkHl0LlH1y4LRnds7wp5zSs/iGKX6BlVZQUur96O8ZIGrdjQiI9f
 Jo+p4LlQSxr1ESe0hctNXUWH+BgpDn0vhV+WmR7hIEYwhkqU4/DKYm/xfYN4t4ZtRu8DBXvx51k
 6lGA9v7S09o2n+rbjy1Fvvad8ez7eQ==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=69033790 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YjBZYspd3xVaAZo-ivoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: U_WFn-BW5QL4bJnV5FNkVry-iZrBDYgd
X-Proofpoint-GUID: U_WFn-BW5QL4bJnV5FNkVry-iZrBDYgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300081

On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> As can be seen, the modification of the control register that
> stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
> does to the register. This makes ethqos_configure_sgmii()'s
> modification questionable at best.
> 
> Analysing the values written, GMAC4 sets the speed bits as:
> speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
> speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
> speed1000 = 0                                   B14=0 B15=0
> speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
> speed10 = GMAC_CONFIG_PS                        B14=0 B15=1
> 
> Whereas ethqos_configure_sgmii():
> 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
>           ETHQOS_MAC_CTRL_SPEED_MODE
> 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
>     clears ETHQOS_MAC_CTRL_SPEED_MODE
> 
> Thus, they appear to be doing very similar, with the exception of the
> FES bit (bit 14) for 1G and 2.5G speeds.

Without any additional knowledge, the register description says:

2500: B14=1 B15=0
1000: B14=0 B15=0
 100: B14=1 B15=1
  10: B14=0 B15=1

(so the current state of this driver)

and it indeed seems to match the values set in dwmac4_setup()

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

