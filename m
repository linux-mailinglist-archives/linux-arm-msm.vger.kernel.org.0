Return-Path: <linux-arm-msm+bounces-94374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDhuI0QZoWlhqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:10:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6E1B2825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9F5A311DEE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848F3345CA1;
	Fri, 27 Feb 2026 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyzxEwvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2iOexKl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D0344DB7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772165435; cv=none; b=uWSSX7lOD9C2D1Uw7G5NAZNgWqJ/4Wd1pIOW5hitDpSaCaadOvSb0OzkIJqUPsZu6CRse3jGJYWdE0Rx6+PtAlGU9BE1rrEyqxlotflF7tW2uh6YUGBltYMljDax+vsY9DHMqP+vxAGY22qoo27yk9SzJWJGmQN843kGetZxWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772165435; c=relaxed/simple;
	bh=Bj0ZUFjTMmu4Nw4UHMoFxZBd2KmFxc6fJ8hukBXmkDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYPCcMEGFTc/iaisr9FG9MNWG0ENXrdgq9cejvZnNSdqaWNVpM64cb8kviD1kekU/1aYZc+5kz0wRftJ5Gm97AHp8LYcVcSL8zfQzRolqx9HLuHo6wELs4/H5ASzitD4/LmJKa5Ku5P8GVa9/OGiv0EDf+moX4gWvfUtts4fps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyzxEwvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2iOexKl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K6dA2353533
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L71qfvZcuhojND2DO+m5ogZO
	lYNnWkJoCk7YZqd+Grs=; b=cyzxEwvI4WMDQdkd7rae2KLAnI3d1otFiYTVagH5
	lap3HaSXas9O7G5N75OB3r6SVBP7oOkzL1eHyahJKg0IWb9XKXdh6XVvteTOeEtE
	hi788YATwSZpU4eNqMRS8V/G2J+4W3dFdj5UBu1jLAutuPZrr3uF/qg1VDweHnFD
	Jc9eX/wOiAWHQ9/3Ft+hZe0Pvd9z276e/Oo/juA3J0FbZYQBRaCgDGa1eEJSzkFB
	wy4WjAYRgo6UprCtySIEtdWTMqagGH+O/KLsuft/0aFyPLkNEh4opWHxFegmHMQd
	gJgDRH1fxFPfkYT4/q0fcCFB3ZT9b8gRbTPE43RQjSevjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u36rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:10:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896fa0fcf27so163090556d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 20:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772165430; x=1772770230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L71qfvZcuhojND2DO+m5ogZOlYNnWkJoCk7YZqd+Grs=;
        b=G2iOexKlBUBbYDqnUN/Jgtg95Lv9QfvUy0AwHevBFpncFi/u4uxJVfJyD9ExUU98Ma
         5TaLIXUivK1/vARPIggi+PAGn8ZdUh3qdRE+FNH1dPKnDIPu0X4Udc97t20+ncMJAiar
         1uNdjzKu3QSDqNKQn6nFFvyHS/ZiJFAKHGFEr7bJtB4KRCwpmdM39vc8z0Eot95VlHfK
         JryA7Xtuz3xYsOzagRjgZn5Ms83sbmBc6piyWfI0GrWbJ/SF91OUoxc1vL1zT+B4Aye8
         bRF0Il8kpBWV0Elq+BGYawi+si6eXPDxLpr9BOPH+2hEjNMe6PX+PcBl75jzLbjgAZdb
         WD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165430; x=1772770230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71qfvZcuhojND2DO+m5ogZOlYNnWkJoCk7YZqd+Grs=;
        b=T3Pgtz/YcNari2CsDcLkViQNmIRg1NThwjshMEEJIChIRve7jDGqo7zSsC3xBgUemL
         0QPGqHOo1CwzG2f2Pjf6RrkMc9g8zEqjx7aHR5PAGuIqAROtM/PEZJXqUFRCo7MuyGIx
         3XrTmXKTuusRhjydEahOloaYR9DRJ7C/GBGaWamv0fYJLjQ8683IUM0kKB6Dx3HEvrAM
         ob3zG95CsDVO+qWaJq86Qn62AOm9b8myr6OtWeHacqFwqwu3wc35z65+3KyUFp+xjbUc
         XCAjnO+P+yCyfQiwdAXmJjgINTo9c6loLlFWVJhatUq+f/+wQ40pn7Bf2rlW0nbFlGLU
         6yTA==
X-Forwarded-Encrypted: i=1; AJvYcCVyM5NtXOXnMPnVV0+OHjr9sbiBW/KAyGdYVH4KbKa2A7YgkGhJaaIL6Wc87J6zQDGVZBnKJyZkMyMSs/VN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5sh9xb0SSJ3KnKTWTe3oU55RmpS4MOIXTXvNxqIrFQlaMH/RD
	LMgx4bxxBTUrEcIzX2ILciO1t0zJhAOgeDyCmjRu4eeL0kah3GfFi9OSCo5lwzfjmwKbs2NEIfh
	xKYw0k55XHn/o26nGtestEtXTACkjSoejTZloy0dW4yk6f5awZ0t3yTNEtqf7lWFppy07
X-Gm-Gg: ATEYQzzA0x5Ol1hD5XPc2/EWTbK/4BBq8g14zztxtiVDRY1dz409AypIv+YUuX6ouAL
	ap5amSObO/Gj6JbgXklwlJYkHyPwIiQbJgeFjlBId3mUO4O5KDfGEEurSUP3k/3x4CwrjkD0PBU
	YSXnpG9T0uHkAO7pqOFG1bq3CNyrK8x2Qe5aMci0cOab6kxly7ib0oECRq2e44poW8ySMbZ7OrB
	fISzzW00VJ2DvED+il3LbMZfMMRq1RpLt3ymoKSCMWoPQeqXiavOHNDdMCtxuzsC+keDuKMQXUx
	JczShEfX4D5ZFj3GTYVGeODLJKfTIt/t7aKzoWVVRDovnLvFieg+ar3bKLOqNuprT5y3EN3V0qG
	XHfJKNu/MPWuLZyBl4FVPtURzsiwzFcQ6CgTlLR++je69VI4ENrKzGu2NOkW3VkeiuqF+apV/r3
	4KURGthSoWxBFqqtAK6oZwfG7eB6pLz0ymBKE=
X-Received: by 2002:a05:620a:29d3:b0:8b1:7c0c:e27f with SMTP id af79cd13be357-8cbc8e54d43mr161899385a.82.1772165430499;
        Thu, 26 Feb 2026 20:10:30 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b1:7c0c:e27f with SMTP id af79cd13be357-8cbc8e54d43mr161897585a.82.1772165429969;
        Thu, 26 Feb 2026 20:10:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e01175sm1585657e87.51.2026.02.26.20.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:10:29 -0800 (PST)
Date: Fri, 27 Feb 2026 06:10:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <2qmyghwciz7rdbprpoy6bwrfesbyqyqmdbo4ejjptgf5ujm3vv@ddb46mmewyau>
References: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOSBTYWx0ZWRfX+CJklsMI6Zjf
 P6ncANWngdyyQRcLNOID0hv8m8i30Btepgc6a0ZBJk+I4zv1E2+lImBa+wfkiUrifm1Gp9g8L+m
 GGewTVMPMkBfO4u3JYzdU/09M8EqLLZQhKA+JLF6PZ0wejeohe5jBODRi+4+KeY2yXaPn3iO+ap
 4T9je4jV0TVC4CikrK0AoCMWd72VmGuprxeEkZg71iW6fOb5XWYd/ri+1/5xKDnzHw2cdhAD2L+
 4AGpisBrRb8+ASSZ9Bj7JeM66HzfGhs2japr/gwRV+XMdj5pQ3Jg+CMaR+6o6BJn6TcnaNntIL1
 tg8cjdpmQJw34VUaG+qxO3mjRImH696Q5yi/HU2jYK32/VHGtD4fa5WyaRBZ0IT+ukUiR7yER45
 nMFSDtSJngDyFqByOeQ1KZZWDUQp2Qf3pOpbEIZbTNkr/m7Ee3GF6VzURnKm4AHC0htAB4koI7O
 TCQmBvss0MoBYwx5jdQ==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a11937 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DgEYNLXXC2yaUqHi_YcA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: uX0lvIMGO5pSb_q6FTpWdDpqzK3U694t
X-Proofpoint-GUID: uX0lvIMGO5pSb_q6FTpWdDpqzK3U694t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94374-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DF6E1B2825
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:14:59PM -0800, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

