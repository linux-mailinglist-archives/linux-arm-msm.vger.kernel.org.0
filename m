Return-Path: <linux-arm-msm+bounces-110582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGVEOhR4HWrKbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:16:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2161F17B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B7BF30BECE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934E6377541;
	Mon,  1 Jun 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqcpvqIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ah3K00xD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFDD35F615
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315622; cv=none; b=eRRyRfAMWdTVnR0QgFjCr4O+jXqbWUoZnSnHLjVktkuvkV9ammgFaz9FwddpQ/YPzyZ/BYldWqpvFs97QiimbbEOuH0gjw+GgHJ3dLzswun2zhxiFcWQwjxRelw2EAkCPUtRvJ62XJo1693iCC6CFMAF094vhgRsy+vLTru9MVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315622; c=relaxed/simple;
	bh=NMLNltHu1Nt29wgOrkX8hVRJXK1Lap2QsPGqXR5IXZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXsDaqdeId+HpztPSCsHWTJX+YB96COsvddzSF5AtiiAZrarmGWFaG/WYmuz3pvb20i3nE/SqKIeslRZEGKVGlsrvAAE4QhIkcSddesX2knIJhPXjUYKG+csAdwd0RFkiRgwxNZhbjuuiO84DsCeJLtjbx6ZPXN2+6LwwjPDQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqcpvqIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ah3K00xD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BM92T622614
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TYA3MtidwBDNp7NQFL7V2gHx
	CYrTzgECZO2TjVz32i8=; b=AqcpvqIjezdUXFntLA1DhaHtgdXrdShVnlSAyeZG
	UTBr3EEvyJJvfYtHHO7OZHQBUmM5TotTItb78EP9oDU0weNZHF3frbkrznD125LF
	nMDJnC7Cpzdt9Cqjk0t49DiG+1lC7VpK1ls7K8uGB8pQpuX5hx7m9NsTBvoEE7HO
	9Vm32HItpBhIDnJb+JywvP/UngAh0lf90SMSon2xMnrVe0aZ0Mqsf+aOaSb/ZqNq
	J0EMAU4s1RDnyl2VPphEDq5/aIGfXgVz6FaYlHbf8WxkOVI3nKKT+CC59y50fH1L
	/B9DDCUUrQnq5/MGiyDNzZmVUtVVbCnIlQ8+8BiDHPTe1w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954g6fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:06:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59f054a3e19so2037004e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315619; x=1780920419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=Ah3K00xDn5vfCQ4cVBnCj+xyXIKAYB5eSzexsbTCBIE/p7sH/2lDPCtCCViCJxir15
         NnQ+GYfpFOLapqhQ7QhFXU9Uo3dsfc5oZONJv+OQKzoLHpSWYjA1dNGYHrbkLd2Z7bxo
         RFAfSztSymUhhz4latke95w2AiKlddTnqog1n1JiYNy6yHvHEp+K3nbSPRG5FzqIBJfr
         G5MLlrDiQez3bje1PHCWQ0n6ZjxIsZ+hAlvvW0kIwhnVUnnW9g7uZzHmeqhqDOf6nJX9
         9RohCob+km8PO1vF/Td1waZTPpW4hJDFJYXXxAsXOZ7NOfWRCWJOJp3BNS0CnL6FpUa3
         7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315619; x=1780920419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=D/u6BrgOXtCjY4//CB9JEjgEetlqgQ5dlKxxaAel04kq8uFeI4IE+JBWYFohQzhNCy
         9t735AWc58fB8kkCvWrIlzJFSqOEwPLav/LqRKV9T2qhcYL9Er1SJvU9TmGf4Szd61Y9
         t6C6dqJMalnAPcrh2QWOenzsvwJLbuB0hsc1Ws2jmVaJLQi+8T/i/B4SC3+u2CMdGBMK
         OoE/nmjUH6m5y4jCZo6we3OrqTvkeEptzFu2FrF/mbFqmZYQcd4tuIbKUR9eqlbQ4oz+
         mqeG3y+bMI7576DMRz0tbnHCLCoRA/lbgz+coz6vce85nimG60EWkjb8tsF1k/1TAyjG
         pVKg==
X-Forwarded-Encrypted: i=1; AFNElJ+z1yQ983u1KUg5eMRYJqQasfUOuSiY5Ddz2kNV3NToK3BEUWjDJ+vnkYMk51Rzj07F6BrqvG/FatDWmuA6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw7BEQbseq9IQuek5izqRJHV1r/TEbt5NfTQXbR4mcr/x9jlMl
	Flp51eHc/8O9Yoi82fIXo0wgcryvkuqNrpVL7R4KDyH2b3DpTfS5vbVy+iZ1EcVoIKAXPYeEOyw
	7GvFJVCeTy6RhRkjlBDMN0vBwIXANFmNyzGT/KODwQDH26VerbvjmOM4bEtAdJ69H3lIm
X-Gm-Gg: Acq92OHdzw9xByyxZSQGb3yp10g9RQlhSMN0fh40g03SGipU1H707c39U9zLs/yzorI
	zOkGrVOKioVZKJHvd6dnQ/+pGhPw40Pr6x+rjYdBtwo4bF88FOoOidPtAESqhKU78Srfr7D+RKk
	Ro4+/uXtx8d0ku/aga0MDd4mpnBqk2t1PJJlTgcqb+FanOOoNgo717T0uSQkqp8v0lNyZPJ1aZJ
	F8jLctc2+A2/jTp8nVvy2oOyT2wFXOKzcN437kUZ0xdmxEyA+g22D0vcB+hAJVjMIELN4ophuv+
	Yt0Bta2+7X3XBFCyzV6Ltz5IQIvHlBRpbh4b7AEQfo6U5EMxlQ2TAZ5MldQx8RhisKVf9vCDowV
	gTleWincFog5A9iKj6B0abeyFMyfZpvMJ9Kmr8a/g5++nQ2SKNUlkVISeuZ4eA66P9KwfFwAq8L
	b1oIhhHJJQ7KPLMNSdOzU6zReU2BfnI91qj+rpqo8X14pwwQ==
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851423e0c.2.1780315618665;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851384e0c.2.1780315618305;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793c42sm2046644e87.74.2026.06.01.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:06:57 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:06:55 +0300
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
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Message-ID: <a37efde6ivt5olxuiogdpniixhok4w2n4qdyj2csbnhzh635kr@j6l6ycprrepy>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: YRNhyNafPrNthlOPysc9iQ_rqcfWYVhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfX6fIRC9jA7YFw
 AWxS+tXJTQpabe+ntiWDOdN53TESHZd4mVJffpop7oYLM18R5zGQePvHQaca4QDixXHt4WX1SJo
 rqW8kFRu9EPScWCawqPovA8PXQ76MJ5Cn3k4NnHvTAcQyMV5J1vcYh+prXLKeycNrcj8+uH+VDn
 SR1sLk5N33/0EKTqloNCl6otTcDF+kb+WVGH7MVavPPbYkLliHmWHMu3gdlWoqHHr2u8Kay2irR
 A/i9RrR4hz98gw6BEABfGRt4fxO+86Zb6PPsBAKzaWnQiKzYhsuz6mgAmmYSTQ3VcQOg/IfO92D
 VT6eJCLNM3zL5LmlhZVFiE24bw7oepUk7GEQHcU88QvYprzhX9dFSewI57b/jPXLmEtCBDDeBFv
 1LirSX+MhU4eZhL5HOCJ0M//Go7+0ifUz4C3DLIPBn0/oTrNdDCZ539Uu6U+iOt7OuhsZcPjErl
 OhqxDCzJfvAtlCRYr9w==
X-Proofpoint-GUID: YRNhyNafPrNthlOPysc9iQ_rqcfWYVhI
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d75e3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=RM3L-PboR186kqoymW8A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010121
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110582-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smankusors.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DB2161F17B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:51:18PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Please make sure that the DT matches the USB controller schema.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

