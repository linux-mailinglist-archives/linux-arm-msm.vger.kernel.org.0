Return-Path: <linux-arm-msm+bounces-79637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74CC1F674
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E519C4E9B2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374A834D90C;
	Thu, 30 Oct 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lke02PP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib+bx/rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1234D92B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818197; cv=none; b=KLZyif+e63uWX6Rn4VjwOSZfnh4tU4P4727DYuHgppgY8cE9T5MFuAtUe4VU/wjMY6wtjU+ESPIJ4Mcxx6VVY8WQo0CDlxMI6xD9BO6BFQJwmxfB8gImnYkaBLAi1ffWgSN1ETJ3dBE+MqIYCEeeDNWD21GD5D1V8JSjIQrFPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818197; c=relaxed/simple;
	bh=XIsDbbcBteQKlz7sWS8UuQ1jLqgkwTVOcfarj7OTZTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH1oWsxHb5KNAPwGvnxuuqQ5/SegiV/VKk+CtSqFxSIRgP3fIs/gRRbRKtWIHHFhbAgbGWMs5JZu+gGGZLGrbzR/Xobj6e3kz6p9q3EGA+3rEShbx3ozIB/cbX+B/dEtCd5iksqDKnUOmOPdITNVzBIPGbZhKWOK30+XHUCOEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lke02PP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib+bx/rQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U92Wwr811079
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZB9HUn7Y3yeet14Pr5P9kSO
	bdDDgoJccQktdlZcIJM=; b=lke02PP8ShDcsMh5V8vn/IlY/phnMoSm6DL2feeT
	L3TmOI+9lyqQT8yp6RcNpAlK5kfv75Y68Cau8Dq3VSNw9/fHa2TL1Ogy2qMIE7eB
	vPXHkeedoKErqcRUIUnRIYthF++B3fKHK928agAqAzdqnXwCI2xlNNz1zg4Ry7+C
	j3PDxOdO0IihO4/45QGZ0N8CycxBwyHrNR2+7Xed4M2RFQy1cNd6Ejw28avLCghU
	JJks/inWACHMOMQoaSPXfjIRYkVNevFw8SFIHrQMhW5g3rjq+GSr/DKXndRpUFOG
	kb2VUyljVA1UDVJUOp+vpuvsa+gLG/gVwroyJe3ocJGrBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgb3s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:56:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5535902495so585047a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761818193; x=1762422993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
        b=Ib+bx/rQyKV1fiXHLwcbldPCj3xKHqkT/zWaRtzbvkxKG7Y+a1nIleHSo4HylvDmYv
         Z0IhX4JrnqNUa5EVGBwDXc8vmpJ8iNYZGIHvMkBqLNuDk1DtTLt8Cx0DfRb7iEyXZNAU
         43VXFe5OFCSbLjy0zglfZb4TNVWF3LPURzOgBJodBEjG1vTxRkqhHlYp1vjxVlqvVs2i
         TSWW041wgHV0c/Hba3TGUZ5Eq9mXM1eTzjgxlG8Zd1R3PB9FXE2fVJBxxueztT747OyT
         1h6THouKFNnPuBlAZ76a7S9cBSPousb/+sa8ET9cIB9LxoY5a54FHfPAxC39MfuM7uUy
         7nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818193; x=1762422993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
        b=qxXm0POPI3u8UdBsYlGfCVjYdsHcEWGqOBWgWBSDdvZG8ip5KkL/5BQks0ze3QWkXp
         XMesnUl8c1Sxg3wOwEezmyf8r9ROvux8sDfaFjcjuhXMxF7fFeo80bOjCf9zXN26jp7g
         bQ0VQP9834nP1uOcejdDTL1OdJethDGKy4Gx/WMlxIE1ShjoDkTn43ksTtKqcpTJ4TgW
         3oK5vOiBMGrDVZrejdyukf4BVQG/v1Gdf0ZedOBz7txv8ZjvXq1XCEgtSVhyH1drTsqq
         wMh0tcDzAc/JyK0aqSJnhSmbmML8jvKRthB4yKdb8hfymfmKxOemtlpOMrbF2fHEQ+nF
         4mgg==
X-Forwarded-Encrypted: i=1; AJvYcCVpFdy5aSblNGcBP+aLaimoqVfPn/c/5BjO1Ixo2g66xTVKTz7zdq2PX1zPnZhi1kAn+pzUK4eiXAqRp939@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdM72Byb+153QGJsjHua9yn0+eNLIRkGx4ESKlxx13DxoYuGw
	uF/IPFCm3fwaxQ3ou7Y6Ad2nU9gILlpxeB5aWialt9x8GNZt9oUu4LRyG25MEgg0z0KOm1V0vFY
	ybHSZHQ4S24jf82YCkot93DE8B1Y/x8b0wqhVSIu3J07g2NPMmn0QvbREvYE2xSHVYhUr
X-Gm-Gg: ASbGncsXqfFODVDZv2rGtYfL038bQgxqqjrf3hGiEaFtRR9TDsgQzfaHVVraT5+oPME
	c/HwI9rzJRS/NFZGocTGrv4pqQW8FjSKl42JqFQLkGstaLs4v8aTMib6DoHOoMhAPCyMkDlj5fS
	FAxaV8vbrd66NglrHwRxeMbBzW9pv5OPCRiZz9puTQ8PcUp6zLzC6NwDmE5o0JWuLq0S7KQY/M9
	wI0Harkgmee/u5S+CDTFo/uFTM2sWVXZYWXS9QlXC0K2Yzt3R1hBBRKLocydZc7D6HapJNO0OfC
	IRZIm8XKGFF8uluZzz8E2jSGdgpAoikXWl+PqmQtz1oN1lbH8eO3i3HXo7BLoXCPHUe1MjNYV+x
	Svh/5DALkdJx4
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr75107175ad.46.1761818192844;
        Thu, 30 Oct 2025 02:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2pXZ7cZHIBfeTvJZ9UTRYJGapckxL928FafPCFjdaoQizWWG6Hm16UWtFXWraP2nuOKNJTA==
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr75106445ad.46.1761818191892;
        Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294eeb94d63sm22841075ad.5.2025.10.30.02.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:26:25 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQM2Sfdu2NqnEB86@oss.qualcomm.com>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX7OGdFtuY+2+c
 N/mqsX+GlSp+m0jfdqxhPc9CPOvzWiwNXC3NaHSC6hpcNQ6KHDgwM7ujY8DEoGolqokl4Kw5EY4
 29UPpm5gE6oeVDuzwtkS3yj2BfGFhLHOS/ACdk4EBWQFHDhb6bdgEMKjQq2FYq9Km+T7fOlxaP5
 2fnX3Ou1vJPs/0RG+m5EylbppAY1iqGLzmo0JECU0X06/6rbBto5ubiB1vZRrmEMXNUHOsGr/Ui
 3ftcK+OvwF1XkBAAmwA82GLwgXh7RHlj44wpuPlK8VbDb6vZEoncBtev2pyYTGeBdRg2UoXDoM7
 IYZRgDySx59medPs4NEiZYNu+D2V5QhPimrfRhDwyfWposb+XJR3SRycLonFU1tK8KmKlK5rgJK
 DzX4hxVKVBjkY3uoOTfyz+igREwMWw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69033651 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=YjBZYspd3xVaAZo-ivoA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: JM8dWZD5G2uxzWr9MUn2zCGd551ftTwD
X-Proofpoint-ORIG-GUID: JM8dWZD5G2uxzWr9MUn2zCGd551ftTwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300080

On Wed, Oct 29, 2025 at 10:18:36AM +0000, Russell King (Oracle) wrote:
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

Makes sense.

> 
> Given that stmmac_mac_link_up() will write the MAC_CTRL_REG after
> ethqos_configure_sgmii(), remove the unnecessary update in the
> glue driver's ethqos_configure_sgmii() method, simplifying the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Ayaan, please can you also test this patch? I believe that this
> code is unnecessary as per the analysis in the commit message.
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>

Tested on top of net-next on the Qualcomm QCS9100 Ride R3 board and
found no issues, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


