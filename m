Return-Path: <linux-arm-msm+bounces-102790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEBYHQpb2mmB0ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:30:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84583E0562
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD2013075992
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94F33859F7;
	Sat, 11 Apr 2026 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov7P4oSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeXp9w9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16593859C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917804; cv=none; b=OShi0O7Oa/om39zU76ieIMtPJJFswJuYD7N/Qx1j6fqYeSgE5UQtHUdvLEpdmCKNaDZhdBXPt+1HRSUa2AtbccgGNTt6tKl8sX3OgQm7OasULPKO4C0uCd4rZcO4r3P61YzmNyl/v6Tk3uejYWQ7KQoLUW3aJS90WkYAQXnZtKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917804; c=relaxed/simple;
	bh=dO6LWOlr4W9KjJsIaQ/g+VU4Ji5TInycrleQSx3ONUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlyXGUs6A6cJ3AywvsSYRGz4wi/eRviXHrvpHVdVki3kDcpJ3mqc0P0QwdYUZhqauUw4KBE8WncV1p+fDJDv5xEhNT69uE1q4JIJJXnJ9VGUSRrxT/G7e7BeL7GRSbN/DMCH0wi+YfBqGz4qZEbbR13IegUiTemljmsJ2+rfas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov7P4oSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeXp9w9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B40IL6516832
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Odlvlj/6+ff16oUwlM8mU+eF
	J2ei5xcOmDMIZAsnvOg=; b=ov7P4oSRmfEPABLGy26lijgLv1dW2hA2IXWCwrtJ
	TKYszGPUBKjyCbH1coPAmskAIp7cw9/VkKg+jcDXcmhZD1tw1H/YQwXWsta/3ljX
	HQFvTVYzuaNdpth0iufnHaKCBvgnJxrgKKptjfGJ8FCT8hohthSCkUicu1qLRYZ8
	sl9wV0aRujGE7y449mTHLOFYJxgo0/dmaOritvwR2olK0zBrMZ2JV1+V7LpG3LWI
	JyoDb9KHzMzWUTY7LXI8UfdU+dCUNbmLUlEDcu+Bnl54/eLtSzpzKXK32ba54BKX
	xaoim4K0DfNKBzXXSjUG9YU5CNH7YI8JyHxHTIIowmTPcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgv8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:30:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5d03ae893so494684585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917800; x=1776522600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=FeXp9w9PRJpIJuidF1+dXiq4iFgI9B17+yJ/ZsjsW78pVFQyliAWCuF8bSiF5yvj85
         rPv0TqmWZTYYSEpjNUvU10yRG60ydXEKa/FPlAcVj917hLMbsF0M7yzYye7U/+qGnP+4
         2djHPrNla9/hNndMwBYFj1Z/qDCpBxxpVUsuOfE+YLD1lGMno6FVWf4cM/YLevfnQ/Qv
         GRf0x3F0LISpb6HePu66LOBMmGjg76OCUns1lRBMNf8hN96CnOyye8k8+XCoDk2eMbgt
         wq11Rj/sHpk1gwlDn7vm4QlT97QF4qOJIqucfNjl9o9Wpa0CWvf8OMrLoBqoYFs5cGJo
         CBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917800; x=1776522600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=K4oV76oApdlH1uzg2x/U9Cj6M0H4f0L+stcnE5bThEA0+8Nk+UJ2QaC54/OukWh/gG
         zb4/BYwW0iqSTWVZYwiCM3sFS6qGrVxlJrQH+GJYqUeAy02dGc5UZxBBeCpdyZrhPPwl
         5gPHAr1dm4rXzz3CQcHIqgzQf7bcCwnRY3epB0+QpVzS5NcyZkGwIRT0iMNSgl5j2dUo
         OSH6NktRWQkiYBufwiKTJZUoAhtck+CXJtUH/2Q7O5kBP2JFqJBlgNSu3yTqQNXPOaeW
         NdHrmimwhgP5g97fwkp+zVntZGgaQnq7NJHh0yiwd1hD8E+EAl4uiT07vyM/tacQgTc8
         817w==
X-Forwarded-Encrypted: i=1; AJvYcCU2RkzQ5U6xae91f8lX3QFjUtJt2JadDOy9NLu7i7K0SgADWUlqFjkCIrZuX93J44di/w9r9AUsdvLIkT38@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWiTiBKW5Y4Nl6u5wxZJsenKGd0b4j5SAlvniDUNp2SfameAo
	Mszr0Wd6tC/HGsLwjAeUXo2jcJs4N1Ee+5JUBvgnJ+ZbjthZiuQy1J2M8g+O+GDG9eA+waerFSs
	U2j8HxmeJeOE6TC/XKdyahVurpqehaK8EWXe7yIkiZ8xL62u/S7hjRPoJPaRXL6vguXHm
X-Gm-Gg: AeBDieuoTYkhfGE37XVpYW6FWt5CRFjbsc2TAeIaPst+Y2HsnsrJfxQXTfu5RRykujI
	w9/pL8i+f25f2XI/gQ2eW/BU7CP7jBM8t0nqlZVgzA+mmjqxILjQZHwyTwOkp91L9uX9DwXv6I/
	YAaMoK4ZI9/OuxFjWK2BAxp6y/tpZmo/c0Ql7MscAU1c3rHNDRyPxizNaLDjCiqjZckV59p1uNY
	M/BxIm5T/3ZhgEf/jEa+JJMCGaUBA22wH/wVejuSunagCfQYxPf7DvqA/BUyxHdt3GJPtQsf9OW
	Z4upvurN3G3La4V9GNh9vS+06kdX7uamVnf3m2gANcATwcELOTbJOl1sN4eue891HRV5nWJCMD5
	Jyasbag5/sw4gr3rNv7aFXhgf7d7wQW5z7zslB0p1bNekd6GWwtPAgzCPCaWP+g6ehBeuSC+m2n
	qD5Ebyp9F7jBH6dfEuKvjZ+40RTKhSv42Pcg4=
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442791cf.28.1775917800280;
        Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442431cf.28.1775917799799;
        Sat, 11 Apr 2026 07:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee865dcsm1472187e87.14.2026.04.11.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:29:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
Message-ID: <glrmouz7w4jomzv3io7gg5u2gtwrbm6zmhk2qcivlzmdr777t3@5w6dr3g2g3k7>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
 <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da5ae8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zayoKZbYlRDyDErFMuP8pdf_FnAJ7WJu
X-Proofpoint-ORIG-GUID: zayoKZbYlRDyDErFMuP8pdf_FnAJ7WJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyMyBTYWx0ZWRfX+TADG6Y9gi10
 JPeyxVfu9Ec/hKbDz536JI0+fgbKBYkwcKlAN3WqXXDSvOzRsTF91gW5KGbNCp63r+wNtC3knCL
 LtXwd8oquN0R5aoijS9vtelJLstEBr4P8Fi37u4sFMJClzpyDRmU1pMU+bq5tPuVZ7dPS+x6GYO
 43ikNB/pjXJfqz/+C5/uWfUOPN/GyWJFs+do6O9irhkS+LvLNa+QsmfuDS7fbbEFXpfz8reeI6q
 ggdsMP1SNKCw6aWBhXhT9YpjjfmOUHxDTFUPFic1GDnI3Ml1qTHxeK7ZEsOjf4V2x1b7k/afjQ+
 uRoktIkC1AxTNpC0o86aS/jLElVg/arEQG+MoXjKTzGfArXDT4UaVrXBis3UokCDiFOV0bK//Fp
 BMevU39LNKgGDVTL0gVfTjhRwS0BXOFr3Wsb6YuWYm7EK8hDG+b3uWX3W8WlX0BBieJpfRd6F2U
 v9UV5oVLsghngd652XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,ixit.cz:server fail,tor.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,ixit.cz:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C84583E0562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:12:03PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

