Return-Path: <linux-arm-msm+bounces-93638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMxiBcwinGn4/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:50:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703C174341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80F293011118
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E193502A9;
	Mon, 23 Feb 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCroSxMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWJqgESD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAD23E33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840196; cv=none; b=I/ydDLVqWT6IGp77/B7iMNFPMIln89Rzhyku9JeLneFCqpACKME0EXLe+m/1gZ8jv3w867Ad/ax9I/KZ7/pOsFlnjAM2/0SXvunNMX6QzFA0c1EZmtHM65gsEJs4O2K2ZWNbd7wBANoLum0mSNLTOzVd7N3dVdZIfl27frotHmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840196; c=relaxed/simple;
	bh=yyDkIDQ61djzixGblWHgmbeEGy2m2r6OjvBOtRq4sqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gz0r5Cqjf1aNKQTge+uDSqhgFyX2R06+Io8K1OtpMxjRX4iV9dR7WzB1g+LH9qEecZ//NmMC2xNiRkpXzN3QpF/uYSRnfy74SmaN2NnhLG+SO9ZqzSfI+lXVi4q+Q8fhQNFXN3JPLIxEvT9jOMPDlQfyg/mOAHli5fiXC+9Q+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCroSxMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWJqgESD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8AVMN1036553
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rkJsbjgrPmHKuVtyeITCWuo6
	Qs6gxTemZ0gXWydw0S4=; b=MCroSxMvREUglMMehsXfDVNamKc0VZ2SKpcGWJ0E
	KtIeAX+q39tjNd4AxG8zfLt9aSVvhKXjUMeriw+of3z3bKy8KMHwJ5ONzmMkdZF+
	viYUPm3k+rHg4g3UnEFe1heRxC6sAMYwsdUp6JN7iEOZHXZBflhIaU7/Mb7MN3Ay
	IvnDpZz9UVH+J6N+9hv2fnsUKL6ELzl//e7qYElVE1Dxnn1GT+Nzv0Lg9JOzhAWz
	pVQv2fLokAUCp3WPaIIE0Ma6lnuxR1Ufrsarf0OKt4tWTu4br/A4fVert1QvQOsj
	4+8mcBHgYqY573DG4sdZVwiYgpG6xKVlWWGN43WC4PIJew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v8ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:49:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8244932b122so14367181b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840192; x=1772444992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
        b=EWJqgESDVMLwwcCOMB+Ahq0i1kIcrqecZ/+AgMqsPAcAl0TxdGDW5AycCsp2JDJzRU
         Wj/MkS56RZQrw82lTpif4vv07zVuC6z/zVkhegvDshjY62WtRr8Q3Jhst4WkMtUQTIRd
         0KEtFQeh5ydv5+ZIu2owGH8Xf9giq57/9cdNO9xNTXjwq02NyUiTU4/Jx6AeBdtdP19a
         ecuKrCjovybmKbpC4JU3HzcYnnKDCg51S5F7d2SXgleAOncIQ8ya+xSLHCq4aEMgAllQ
         HYGjXEzfyPO8LkSM90q4Ps64K3/VtG1CSZMp/8lmQPxlDItv9Nztmn4IsKIflmwNrS5J
         cibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840192; x=1772444992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
        b=n6uYE4Bq9og/lFADjWjEkw388tT00cRRrEhJJhUX6iH2BtOWru3m87tWlzkFR4Q0lj
         cILrisCKmiBH81YvgXIFElCilyXs51aygK3/lHcbR+JV+WFnkGkrAI+b4ENOgzwVtpKe
         7ljTAZ2peEwo+LP0UxusvPgOjNzAAx2QiMvTZBkCHnVFRsKU1NbWJI3j86oXjRDucr+C
         kmqInKCX1v0m2NW7w++ELTER1B2hJRLCjSWJjDCrIuCnUoGjzr8dPfV7dByZjBdQdrRg
         9p8yvch7kdqwvoDMnSmT2SLV9eCalLD+H53Gqjb1qiSyWSIDtW8T82+kl2mD4qkQorRF
         ALHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZs9l/AvpkWs6ChfSPdtlgMikD0RgISTwAX8hJRMm84vtLTNXn1Cj1rxHZBN2yIuDdbFNDHQVvbM15tHj@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjdvdQWWrRHtqNjadkDREGuKEQ86xx7FvND81944opEqvovVU
	j5YPj/PWyIOGlHpeqg1zRcCbgL/cFsMP9sLTMzj/fKGtpLN/xztg+HXkU6rmx+XRUVz4FvapuGi
	ssxIG9vbJz3x0ZxiNXOIT/8t+qE0/eri8MKvHSJNtnuTTrIUj0htVQOcTSlZcJSNds9hjHnh6gq
	Gy
X-Gm-Gg: AZuq6aKx91Kjj7qbspp6SA7bY2R3v8bKDkExnukBqqjPaT0dHyi7ua9wBiHFD2aX9/b
	jEt2yXNT1P+ShHscl89l2dyH3IfhzkHCakBVZtKmdZ4fMs9dJ/VyzWlka8OgA4w+ElsKXtjSwvj
	00R02mMwkup9EW58FiE7pYi00WliZnv3i4WbOLfABs9djfVTp/NYnsdFs7AqFG4Urry0qN6mjrU
	VfOyEJuW1lIIx3eqonLGTBfF2Mp6PWpJif3Bruj8MDT/POebu7m8JoRBXgZoBqxDZZstMhH3zsx
	took6pDooaDs8UUX6+9jW3osb0ZbnlWTeFmOa0mXgcAXU0tlhXxwhpGZE8iAWycwNhSmrjrQ2vp
	9nlf3r4t36gnNAGCOZt0WpERrfbCRegvCnK4=
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id d2e1a72fcca58-826da8bdbc3mr6321588b3a.10.1771840192207;
        Mon, 23 Feb 2026 01:49:52 -0800 (PST)
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id d2e1a72fcca58-826da8bdbc3mr6321581b3a.10.1771840191756;
        Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8baa34sm7795039b3a.51.2026.02.23.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Date: Mon, 23 Feb 2026 15:19:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next+previous 0/9] net: stmmac: qcom-ethqos:
 further updates
Message-ID: <aZwiuVeEAcuEnP8F@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX8dWgnSDk3tOW
 zAm1lBDacvwlAIaHic3lQOO7S3V4Mx6h45ZOFbfZGXz2UFwFkBOxjPw4ezXkNtyyemgqlpboqbx
 l2xIbKZv7/5VTw1QHeEDQfy82EpDvrE8dkaXZcyTlUrFPB2XK8HGX2coJ9dH9yaUfp22WXwnviD
 Tg9vzuEAhmbxiupFHe09pXR9ihU61qCK3+6j3PccA+sUbh+2NuwyytPTb+Vr7w2/BXRukK1jOK1
 +A9DupICwxrNvVzLrNhi98SgpnxMF3wYUGMpjyPn3JHsFOU7G92RtHBUIJkeSBBqpgsXZm7DQcF
 dkirT18F76NRfLMSRSfQVM7r7UM4EpqBfNXUqgfkonlup2K0qFnLM7HZA3qiaXUpjmo/rVeRoXX
 VhRZpemA+MYo/TiT24R3vnQqXHlQLB/PsP28/IxNQQW1OenDddPAPbBx34B/p4TKpB4oDi8fUSV
 U5jk8DpTKhD5pxtPVzw==
X-Proofpoint-GUID: 4l28-SbtQRw3a1aFk0LZyfLzWYUi28ie
X-Proofpoint-ORIG-GUID: 4l28-SbtQRw3a1aFk0LZyfLzWYUi28ie
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c22c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=M31p6wNruv26cYMHQocA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93638-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6703C174341
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:49:08PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, building on the previous
> series which can be found at
> https://lore.kernel.org/r/aY0aJppQWUC52OUq@shell.armlinux.org.uk
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC.
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> I've included the set_clk_tx_rate() patch as that was tested, which
> would make applying this series awkward to apply without it.
> 
> Mohd, please could you test this series - I'm hoping it will pass with
> flying colours as there should be no change to the order in which we
> program the hardware. Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++-----------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 68 insertions(+), 46 deletions(-)
> 

After changing phy_set_mode() to phy_set_mode_ext() in
dwmac-qcom-ethqos.c, no issues found on:

  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


