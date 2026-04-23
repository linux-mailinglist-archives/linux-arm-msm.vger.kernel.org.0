Return-Path: <linux-arm-msm+bounces-104208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDa+Cna86Wk4jAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:30:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662244DA08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6009C3019903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF37237FF58;
	Thu, 23 Apr 2026 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTdwJ5uH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzzRsL+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8923FC5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776925792; cv=none; b=sCl+H7vChu/QhzkwFkU3uGAHxcuQeZ2B2BthCw8AAUe4yt++zYheqTD65ZTgKslmMUG95XfOBlkohkw/WuenE/MIP4R5GLAcLo+4YLqYtqU2MSmAw+W3XWqzDVYSS+MM1P10NuW838byo8z0tzTu4cv1ozcPq5f1G3xxfUq+u3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776925792; c=relaxed/simple;
	bh=lWfyMIyMoRLJG7qsDI8i7QMbJoMWcg8Yp81uHSrvvIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJNIn3x8nOno0OFSfXNQBQ+qsin+KF39WFpX00OI/HacwbdYT4uBUFVipaYRCKXzsVkVpz8qQK0s8jbO/6V5/WsWVewCwzHm56NW+5angG1dbaC5UEZDw3mx8kF/iYEksgJ8Lji8H5/ZmhvXmJVS1W7FA3QFom1MOEOcWnjYOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTdwJ5uH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzzRsL+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3BNb4122546
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UyC7CCp74qUg3I7ppKeAkn+Q
	uNwtibiTJOLMOe0x83c=; b=UTdwJ5uHi7EFiJct6qZhLrJTPF0QIOPWLsIcVYZe
	0aKVJJZIfcYM8QFm7xrbf23iQS963VZ7vLiJ30E72yEdRMMFyJPSwapB+Ax/9qJx
	LJXgFCfEf+0204HAApwp+G0nP1fbs8/ok766QeHjqDYLoWfQrVIdBTc7h3nIsJw8
	rArQD22m1iTazGCcUe4DSRTDWhCyzSvqEvZHg2O7f4EjS60ifLSLOlvpU9EPMzMc
	cNHkWrAIQYH5wX7VYPUkDLCJiUqW/2irnqUNXJKigiZT8pSuNx1iiKVvliALeomg
	76/hy+lOYXL6E2YnrE62Gl0iHHC7qOaPZysuHp12sHufTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h82gbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:29:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so8555067eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776925790; x=1777530590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyC7CCp74qUg3I7ppKeAkn+QuNwtibiTJOLMOe0x83c=;
        b=LzzRsL+6H1EDuSeD54qpG2EBgOhJQvILmL4GWw1ihH41c1bwpbwan38FzmkTOlaha3
         9YFZ9cYzVnIgZ+4hx1ldMlixtcq51X4aEoRf5qoAAoKH/dBO5uA0nVauNCDq5AqwVbW2
         5C70o5pUSLN0GqRfDeo3LjmBYrq18l2v8TrgLpzG5vs7K9AkZjRBP15PzNuVMOhbCDRq
         hgGALj10/AZH5yLnfCtHBgBrIXOp4Rw7PHt5zxgvWGK1e49WcupqBMXgcNjr09cOTbXy
         Y/1Xx8/MGP30rKYzTsB67vsg85XKMluXfk5D6o9l1OJT1BF8T4YhoI09Quk3tkJRw6TB
         htbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776925790; x=1777530590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyC7CCp74qUg3I7ppKeAkn+QuNwtibiTJOLMOe0x83c=;
        b=QgwQs5fdkM3TDpsdTADsYuxgYHMR+u7K1duF/HO7A0sFIzCXtmok7/iSK0dNI7/ToW
         VVe0wKSzUHtyXAGQMgc2vLNoRoLp1S9EduRtOL/IZ9/dqHLcsCU6wUiXHsElLxB1zsY4
         eVaV5i/H3St+//+3L9S5KHmBwwkIoZdgoKaQ1utwZLTrChGsX6fu2HjieBd4M7heSNfF
         l22vnyOOuquvtAmCVW7DMp0EkPyY32ujShsWkcOrChc8KyzXtbApbmWuFKXo+80kaRCj
         ysSt9Ca7xDow8CHQDInLVFhoj2pfO2k5RgrNG6O00chfkWcWLeF/QdcP6vS6A6Rh09zW
         +7gA==
X-Forwarded-Encrypted: i=1; AFNElJ92PZ0h4iY83B991DNekVD4ez3c2usotqDRO5Tf0bwMt3uZG6Uu0CLcvCz7dj6T0nF5ooh7P6L98XCsYaT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Lr+d8w55SkvDvyojUljaDv86YQTeWqQlQhagNqOxm/tkbcr2
	T8cHo2yZdNNzYhYcWw6NIS4umSnYQswcjqFvL+9Yj8wqiVOZqPDlHvX+Ce99vOE4QTAtazdYd9b
	SczHfQnY8mpQ3o8KsWRZjDfktlxe47lVrP3WWmYzyi/iN20MQdKlW2SSRNDkVp6/UJB+G
X-Gm-Gg: AeBDievoxyP1oiqTv4etB5SEZvNCVyiQ0kOyhSUxf74gZuTw7V4PZ+b2qX1oowfPPve
	e4M9mODQwBfyfNMxrM/vSzZtwLlthWfdy4eit4Gbzrh715HJvU44FoZ2NBXyEPJIQ8KFD+JTJUZ
	jXA0pownmkDoVlFDNg0RJDM/TlGxCT8LF2IxISG3UrQ4LDPDd/Pgq6N6/0TetAi3nBKDtOW6KL7
	0DqwHY2Kqj+/PYMPIgNT5wkjsv70SjTKiesH87FPv0wdSzMFjFvUCrrC1G2KO9Gc18CKyEiFPzx
	aktrqTZFWV3CR32EMUHyRlNDA1wuVPzxhSOLKGurqJjvNHnde3BbeUVroZTd1NUgvsUAZy5T8JJ
	hXakwpUuJBjWOtEVmnRdnnuxNuQkKi7iQBkRHqucliAUNPawrE92Q1RqYv7rVjmpVTt1Wy7tK3j
	O2z1M=
X-Received: by 2002:a05:693c:310b:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2e46538dc17mr12386999eec.8.1776925790174;
        Wed, 22 Apr 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:693c:310b:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2e46538dc17mr12386981eec.8.1776925789616;
        Wed, 22 Apr 2026 23:29:49 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm26929968eec.13.2026.04.22.23.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:29:49 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:29:47 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aem8W+tV6POa9VRF@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <fb6e8d3c-4cb1-4c20-a570-e9f6ae9a651c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb6e8d3c-4cb1-4c20-a570-e9f6ae9a651c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1OSBTYWx0ZWRfX+wm6Nz+cH3QK
 rNzi6jSswABBrs4b0WIhshMzVifkwqjX9xFaBDNSlZi9Fc5B+WlkIadFlUPf+IRg65BqJ6lFasS
 mSVQpXDtsbwSPwT9QIh9q5BRGA+B0fex07wwzBoY1vpGF5bSJpWomWdOJz7rfwL/fzw2GFfrkXu
 DnoH4TvulAi1AaKKzqOtA9XgFYGaH+uS75rIXyQINu4pij/GgoTB68nYXdK91mp0L9kxva2YfA8
 GkRWq8SL2XsCHyaYTNkEHNRa6bGFQacPbcF7hGw+I3yLvP3oiptTlarr8ERbD8zYJAodx/6B+AT
 NZY06Sl5AkWzDQxNQOXPMiU5eCqJ7cRWMxBjguk6uI0aejwU5tPtL/yRQnsCNQ4LdYJbCYzdjCO
 aj0VJl0tc5QGTBmC3o1kxConAUH93ALeg5fWvr1LkM9aL81rg+zNidJOa3VOizXTPBpp1jdQMlR
 Zm5LyHVC6q50wloEz0Q==
X-Proofpoint-GUID: FsbMgvg4D0wNrOAFsnfJkRgNwiNWrHTk
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e9bc5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sVFJkvLo0iv11KXttJkA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: FsbMgvg4D0wNrOAFsnfJkRgNwiNWrHTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230059
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104208-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7662244DA08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 08:27:02AM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2026 04:58, Qiang Yu wrote:
> >>>    reset-names:
> >>>      minItems: 1
> >>>      items:
> >>>        - const: phy
> >>>        - const: phy_nocsr
> >>> +      - const: phy_b
> >>> +      - const: phy_b_nocsr
> >>
> >> And now I doubt that all the changes here are for duplicated node.
> >>
> > 
> > All the changes here are for 1x8 PHY node.
> > 
> >> Maybe just the commit msg is confusing and instead of describing some
> >> node which combines two other phys just say what device is here being
> >> described.
> >>
> > 
> > Okay, I will focus on describing the required resources. Is the
> > description below clearer?
> > 
> > Glymur has two physical Gen5x4 PCIe PHY blocks: pcie3a phy and pcie3b phy.
> 
> 
> I just proven you that it is not true.
>

Yeah, I see it. I have to say you are right. It is a 1x8 PHY. We can set
the phy-cell to 1 and controller driver use different args to determine it
requires 1x4_a, 1x4_b or 1x8.

- Qiang Yu

> Best regards,
> Krzysztof

