Return-Path: <linux-arm-msm+bounces-114768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xcALBhIUQWo6kwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4936D3CD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:31:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QTcsZEfs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i4FvhbeL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76746300EAB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8BB3A544E;
	Sun, 28 Jun 2026 12:31:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF623A6B65
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649862; cv=none; b=RmmUXwdyeJN+fZee7FCscjQqokgkqWlYoVIKWpOEkH4V9WabqLwZyPy7chR+rURriB0dKFhqUJrDpic5oXdjPB4beOJXKw5LOFnl4CVAIT1HOapUyDNHgO6m+rb+bdJeWKE0kKLqR9mPFIyjk60eXqxmRuLPTC5HXqUPVPz56xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649862; c=relaxed/simple;
	bh=kvvgU/Ltpea+98QbQFnrD/PULZM4PP7T/Cf+PKnxCTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovS9ozWlt+O8Y77SnrTkLNm3qaMgld31l1Xw8vac9hPsljthXH03uoHWN7dwS92dUuT6qepwVzQDhhYIdWOyXWiN9MWk/Ssc2rdvQc7OzEZoZnAzF5+ed2IhgVA1ahG/Cf47spbqr9SOPLo/MEHul0ldmLdkWmDIC+SdUaLN1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTcsZEfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4FvhbeL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2F93591271
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMf4XwXgybpl72wB2JwO5JN4
	qSQjXQLTpvnjFvTGKoY=; b=QTcsZEfsIPJbAmTCwTRdl2F5UXRaVjhcwthiP6em
	waXwTWX5yCRG9J6NUt1smlFOOt0hulXnEzf/sKVeyJlfJV3PQK3BOap/A9NIMTyx
	3p/Pw52xg53tuM/Ul/PBHTTDa+kFca6zssmmncij+Gk7xN4kcQkUgzvxtV8062C9
	772i5l9Rt4cZ2cf+J03N3i7y60hraHELF8M+Q0cX5qZW4lKF9iuPt/z12iLy2Bcp
	NtFz3r+S7jAYfV0ewlMXIYEge3G+w81OuBSzmCojLghmxqnaBGlTKm5JJcQv5pJA
	TsB564+Xp9RzgUWeXiAABLywss986mGRmg+/33wfK2duCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2rkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:30:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b8fc5cc89so290416485a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649858; x=1783254658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMf4XwXgybpl72wB2JwO5JN4qSQjXQLTpvnjFvTGKoY=;
        b=i4FvhbeLx2w13KjPOrCKyst+1W7yZ5Ug9Ouov1/8LlQY1CcqqXryEDyv1MKId/5hxT
         TuqBIqrma21Gs7Js1I6Q42cOFhXOArUbjwa6+VO66B0VJxcH0xwdrcYWeatEdEcxYeIP
         1EcwBEyYJdNYIVsqmMWrIgwU/pEbRfj08e5lShZh7sqcdUgnAtHkX/Z7DxG/uEEvWTuQ
         jgVTJ9BL7Njcsn7gZ0Mwzf5DnciZVLKCrmP9MQNkqaigYqfNRQ4ilbF2GVWLTrmCRRb3
         Y/OE6sFIDM336hhzRG1ifNP81vkn7p5uG2RZdvDoQH2MWFuBeIMkA9I8BOnnE/jw0/5c
         +u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649858; x=1783254658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMf4XwXgybpl72wB2JwO5JN4qSQjXQLTpvnjFvTGKoY=;
        b=RS9L/gnxpwu4ASPGDyAcXWYwFUgaNwqBHxesZa9hC5eA/f4Xpbz8z9CJg6QUZcmbP2
         TL8p/iRhEnnmXjhzGXCnuf6XTBGZY+aoULPy0VHi2L49izI9CW3IZ0vNC8AL/eAN5Zqv
         M00EvM2vZY+sI262klClTSnD7KkvSRgnWcuDqT5xnnOohMs3q95vRpjf+ttNbr3tznZt
         aG/HAo3gkcn/uFws3BcyQ3mmzPqK9BeX9AT3hpw6Av6MYCZbuAHKHOexmQgMq/KAZv0M
         fqCvXlHfwZhu0vSAhdgCiBbEz82MKuRIqz2geZkSG47UVQbGKTq8CORCVFmsOvEkOvX/
         r9ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8e4cFZThJYDClhDyCg2x0eVGk9If2Hkbjdn7W/3fER4epHj11v2N5e6PO1xb8H/4qtmMopfMcMgcFlgWVY@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuNS4RvIOoxLTs+0fpz12nLZRdGBWbTcEW9Z2OREvOKnGV6bm
	9Tq7w81XgoFyCcjZqF9izRRUlGLb6R4Z4Gh2IrGu6H2cYJCKyNYl+GdRMzOXig71rqhU6DjxbTV
	5PVnBNYp6eJh9MOvOmFuBA80K0/zX/btcX24glMIsch4DIaSWB3bk56lr/R0Tp4Ken9fY
X-Gm-Gg: AfdE7cnPUY4CM4XCZUPlICA8tI2uFeoyTPraF7mCea5vTk5iFdmWldnBC4ru6zrM3B+
	4AmZH1FvnJ9rNzwFQI/gYNxjXVyDmwLj3EAUi2QMZUafpATyTtjyMSjsMJ4XNxdbL+U41DjIqET
	HBMQGBvK+sUlE23YCWxkAKKI4YYOZlF1596xCT2EyZmQml1yy1FUfsUA6usmvp1YxkCAk0pgbUM
	pJF5g2A1ueRJvvFdDBYx44xmiaY035FYxiKAE9g3lynz696W8Cj4aFzzxLsSNAaX6Zd6RdG0tTG
	9nfuhQI0ZyTxztCenfDaDEKVSCyoOW9E0DizvrHI7a5pIgBe0j8A5mqmNgwq0I/z23ucpNsOm2m
	ISFOkckWLl1UjJOkw/lIgFIbhzb/i2XSsSZ+H9OpPsfVRfxupjjmZ14KmJDY1NcLWyG4EZtvIh7
	kyZGlME+bbMKEa4KA9azhHOw2u
X-Received: by 2002:a05:620a:f10:b0:914:cf92:46fb with SMTP id af79cd13be357-9293c027a38mr1973397085a.32.1782649858095;
        Sun, 28 Jun 2026 05:30:58 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:914:cf92:46fb with SMTP id af79cd13be357-9293c027a38mr1973393885a.32.1782649857652;
        Sun, 28 Jun 2026 05:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeabb2db4asm1354862e87.72.2026.06.28.05.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:30:55 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Message-ID: <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX+H+OgX/XYGk3
 5CtaXwXFYfAG+k+PLPXjj3xcr2SM6ARkhONTdVqj+ul9grnIwwePGYhAxXnC/8AJaJBKlNroCXC
 xitYPmMxennpSW5R6oaSd6D06x8nLrM=
X-Proofpoint-GUID: pvGgGUQe6F3l1NHGxYDHkDka9_ui0OrQ
X-Proofpoint-ORIG-GUID: pvGgGUQe6F3l1NHGxYDHkDka9_ui0OrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX+Ep4gwENuVIN
 Ixmgbdvyp4lCrZZiTVO0QB8yh4afHmneh1jvDMhKVCJS1AxteIRPyLVu9niuiztUintqdNZb7WC
 +i5+q1sKLlsg4J1NAObqXrvN8BRVvaG/qzjzbmSQoWF6rcrfn8tzoUmvT2EBDGcaA6PIgoFgL31
 CaM2R/LwX6XKSz8sHgwp56O3S1gHJwLbQNglGlGd68KdyB0pFu8KfkrI5XUD+SSyDJb7A2mbt53
 TbY5h20/EN/6cCI8g29IoDKk1uRqkZ8GLWayCJeeSzKFeXU9f/1AhrBE4c1uRxsu2MsuvdmF/Xi
 0q6b0CFDWutvQNlpv4Lb8fk+65jmSKpDdCcvXi47PFv0AgRorq8XpXMyu0+EL6hwoo6Ggnfa2R9
 /0f5QgFFJfGQ3FwvA/LWazevwUeDLUqs4ni10oZ0IteXhjeHa9SAbcq+tZJkRB+rX+oRi+symKv
 2rode5W2VIvIHVe1zbA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a411403 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VAIemredmIekkDCMH-EA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,ts26c3u27k6n:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A4936D3CD3

On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node.
> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>


Oh, and I nearly forgot. You are resending a patch written by somebody
else. What is missing here and why?

-- 
With best wishes
Dmitry

