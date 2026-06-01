Return-Path: <linux-arm-msm+bounces-110583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BYPBcR2HWqnbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:10:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF061EF0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAAE0301903D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75F5377019;
	Mon,  1 Jun 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOkbTG24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj1Vnceg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE4377031
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315666; cv=none; b=FBll5kcOErXXE6wcfXDKYSa/Jd5Au23TyEGEk88MJYQWBOef5nePQxLlmq7eYAFaOcT7DtUaQnlJC7Z4QhPO+ybsYqT29l14xGWS014JCiuQe5sHMjuvoJM0+keyMkZMRmwx4q99w6F9vE3ZKpZkikIhGTPQqNHfP7SM/cozGxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315666; c=relaxed/simple;
	bh=zs0qdbXs2x30afTWW7YL6ZC9DLX82eZT/SOhbldZUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAFVF+QxYBSwA/c0zPNYYY9PUw45kHqLP/wJl8xf2lGgf9ZWfJmOp3EW9jRdbBdmmlZgP2ic6w2dYRwIf1n7URQp6Ecqdfn5S56yXqbV5UCju6/9AP8WXjkqL7H20UHmcQWrEjcbjC8BvAI0DDhQlMp2NxLsH1wl2oRTGQ4FuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOkbTG24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj1Vnceg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fOSP145081
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv11lKJOxLoelkQcyG8M51LX
	H0JVFSvQtsQEal0SIx0=; b=YOkbTG24moufP5CdBcqmMwE9sLCpQl45J7dEwBT8
	f+iuJCMLrmkN3vziDKDfcPRPTGeeJqfmP4N67LZIJik6PvBnTPK6b5JjrhMpOPy8
	qaT0kZ65/fkIpMUjSKkwvhpTTW05D37684pzg40tU24lK5tLCcKtF2vKtIULHQ9P
	7hwSeO2F/0XOyb80YXw2B7gODzRsq6+7nfxlDy9KpYVin+bhDBl9RqtQN6cWlG/9
	aXTlxrp+e0Bdby+gBscZ//Q33Yddd70HtNXNbNZib7Ct+pDNa0KRFolOJJGFEZu0
	laK7XZUa9o2wg2Ljsc4dfe5oi3gBuln1DW7jCU4TLNQt5A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6strt60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:07:44 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59bd734ecbcso848898e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315664; x=1780920464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=gj1VncegwH0cESmBjQXP5s5apMyQ1mDGGfhByd7lQ+xO9XIp9WRgL4pKKaqlvBeART
         vyoAqeFFsYSRHkarEcQjwuFFkMIw4VP4U5CIgjaGuak2r3dOdKt2NHyl59+u2r4o6NhM
         I8goOHs4MqaXqZs1NXTzaepD4eysAefZWHJl2b8uv6zBXXtmyYXh7ilKAhTCjfymTYNV
         1oGJnNY9DoJUbw3cZ6+Hp26ouzwgBNjAyM3y/nqL3CMemI0eFAmQB3ACV15ebxoDe2hk
         iXtsYp1qtJH0ywNYtcaZLwoC82hDXF68ByzRLzbz3jN5wQ1GxpqMkAoGe/RDaeg/WSWC
         4Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315664; x=1780920464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=AQ3Ay3Ou0zDptJIFsx4N1/iXCSQwxn60lbntH7Y5EemY/5n3zRjLqO0xV9oPLGJ+DR
         7+ommXHl/68GF1XaD25fXvueDF+J8sT9EmRt3mE4DGRpghbMuFhINbgtalWyh74NaiSI
         7t+XEVMvLxTxof9BHXvMf+V4H2NeddAggsYcUPvp7elT3xVRHKTsjNmBc4rpAowzj9sZ
         u3kLiugYkKlftYZHMT20EX1bchJS3veKXCrIhBYPljWfUj1s83iAqmjGwk3HCxfLLm4J
         Fv1LiUmkz9ZZB9M84fImVaDOc57DMODVDb4bmTXAhGkNr6Mqb0bmBCqnaxY5x2AsFzlx
         CBdw==
X-Forwarded-Encrypted: i=1; AFNElJ+gq/ho2et5im+Z1HshTiUD8IR2/jR1tqByzeNfWLEN1NAK5fSc+e5NDIwipqZYa/GHU2wh5kvvhRSZUiNU@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdXeTTUPcvd3bK7QavxGp6UC64V4Y9x91rbUXIAjBKHl+LE0t
	EiOLb8l4gykpBDr6L71b6Bb3hu4E94e/pnDWVcwZy/7ch3X7JuxeWylPuUdcOgahfQD0sPPo5UD
	kBAO8+77F2QyPDkJaxHHyLtCEPT6+NXvXhF4zMDcZxLA79evix1NTdKFxQ0EolZuMavDM
X-Gm-Gg: Acq92OH5Bup+TobOgz+glXirZmnDBiN2TAXaMZd/P75ly12KRnpO6+0ErkqFXllFIVo
	h/SdRGWQxmz20Q2/Ds+BoeCjdQYWoOy7yQ+20+XMkswXymQkFjC0StYOTCPrlnbDZcZ7F44Lfta
	33S9im+zUv6JS2SB1oFixMCKlrMiaUICi8bINM/blwG+9qvQhBynViH152HXXfWHFvfxWPpVuc0
	5AhrQcR3e86REQZawAA7MAUTpdo7qLdWTknUZm+jPTTyudnyjHjcPUM5DXI0w7JzlLIgj4KLTol
	++oqbnadnPl9o4IHRhv3P339702N+Q7NeaGzljo3nedaGiZEO52cNw2mzQZv+EYl/8ybEGBKW9d
	/65EwzT3FQWNDAofwT4TIru0QJMMIggnsibwI1zSb46CWiyxYVHjnksD6v0KxUcDrz0aCG/I+Rp
	ZI7MZBIbs/j1zx4ce/U3Oju2zhqD5ok3awAQbYBRt/4IMWiA==
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683123e0c.10.1780315663857;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683042e0c.10.1780315663363;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm1516467e87.4.2026.06.01.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:07:42 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:07:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Message-ID: <vsbimklkzmee63nfwpnx2b7dtlilfcaqwv6d3gj4xkmm6x7hpd@rdc75raf7q4b>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfXzvsiZvqsqo4j
 WsIkjNk27VG0VBjYW8s7RZQDwaAUAgwnI5QM5vzBddqrM7QnzVtniFqD7LkK0fABLpkhnmorzZy
 UVx4xLKG+/4PsVZIA4Ip3J9k9uU0cf8zjBowvIVBgoNSNvuFRG3PiWxe6qjFsQ4iS1oeKO3SBnI
 qo+QFFFOPnX1p2OP20uvv5hNKyXEmlZGCx93ZZk2J0ViUQkbLBI+s8jKIEGvrdlGL0dddb1eNAJ
 QKGb30wCuc7sMzHigUqYsVYBJvJobW8XD2/2md2FHLAFbORpo7TdVrMtdtSCDikGmaGY9DeL/1o
 ixVAQomkf5brFyYc2elWImdDbP/NbwLnTNMpZ5OSNGFeEC91zs/Zq4wocRlkdDKDoHjR4L8/LEc
 V03APuZW6Y44LWfTJeaYk5QG6SMRRq+CP4OPZ8fcUYdDC5GGjKe/tFkfCDTnkRlD5Z/unYDr8+M
 Rc81ZYBM0+7DwnNL5jg==
X-Proofpoint-ORIG-GUID: z7eRHCAHKSnliQ2Bck_kXmJfavoNWk6c
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d7610 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Li_iKjNru-aZ8oNNNaIA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: z7eRHCAHKSnliQ2Bck_kXmJfavoNWk6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010121
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110583-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smankusors.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2AF061EF0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:51:23PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

