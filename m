Return-Path: <linux-arm-msm+bounces-94853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GjBLRFrpWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:48:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C428D1D6CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AB953005165
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5366333A9DA;
	Mon,  2 Mar 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITkLkbxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPbLf+IA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD2335543
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448208; cv=none; b=Se882eOo8oOsiopnf6sXSBK6fz9VtwjpapJadU5fAFsln4rJfQfBLygnfCe84qBuqYP5RF7BsQY5Sc9HGAtEZk2EaQh5yvy+4TeEKq7RGeyba/sI6ipLfr5eu57S9ag4Ek8bd5/m9zIqbhrnv5SaeKxTzB4SzHuMVZx7tDEPsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448208; c=relaxed/simple;
	bh=AzLOU+Dioy319MjxEB/7bCgWCdP+xWtfKHD0bcotn88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQZaxQEZjJnFWC0u+0HhdRMY/fpcPkqf6FjEFta3vklbsPeec9vyvHhogN4Y4sFt5J84/C67bIAIZDkYpHcbkM2fndJ+eZYigfFWV6OnpEDyhfOzaLPFPSjjp5Vo/ZUhKkSxtfiGr2bLJFYUPMPec/aunTK7BCpYaaTtBrSio2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITkLkbxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPbLf+IA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K33G782814
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkJCvMZIgGYxLcpolxX1WL/a6sxf1uR3ouQ9cmg8wEA=; b=ITkLkbxU2J/Z/EVU
	t5GxNVKZWpgQhk4g9ZR7zpKRkMbO+i6dtXXeos1jXa7FksbFsp4YwSWduTGq0sw0
	lLyghtOHSb/wsgidPTpgh8U0FsCjP2U9PGH01kgu+6j9DhtKQk/ZEX9hbaHePBFQ
	21YkJDGjP64HBxhRJ9Gr94eZV8wXYvitTkJp7bNOdl3IA38xDTGq2AGetliDnR05
	LzFvd0CiYIxYF7Z+brDgVkrcy9kXi2KjZR4XykjEDEXsgAX1NLggeBZBqkNlj6TQ
	c+FWCigZJGoC46q61Mqf06XJoAG3Q0YxurxmcfLj2hHuAbZ4mFBUhZDjMix8nLSz
	SFMhRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00a02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:43:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so426549085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448204; x=1773053004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkJCvMZIgGYxLcpolxX1WL/a6sxf1uR3ouQ9cmg8wEA=;
        b=dPbLf+IAJUm1/DEqARj965TB75nYwip+z/5+MldRE1lJyjSsu9Qh1AHmQUhSCNWbmx
         0yZkgb91asgaTP47/ejzN4PdnETkGJmhal1jR9JlDN/zl8rCXY64GW7F50SbH2B5mdei
         Q1GYN2/B092KAauAYwoFFNHRobgRPhLkk6ygjUUc0ITQiG9pWd3xe1ab14FXKx4EUE/G
         fRXYi7vqvPe6ELVfSePP0YPwXkm70yQfmAaAMIFCg3T0CAzI5lGmaomHgvlhANya/qS4
         1DqRmWfv9J2tyeh6y2gPMUQ8U051azXZYXaLT6HEHLxjbquk7O97UVWlrYATqQxG3oqF
         l61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448204; x=1773053004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkJCvMZIgGYxLcpolxX1WL/a6sxf1uR3ouQ9cmg8wEA=;
        b=VgtAf+8lnmJmRFkimL2tBwk+QXyknSzMHhhEd16BhQkJOYjMXajzx+3OklES1hq7OI
         Gj0ITc3NRaiD7LckAQ70nJWnAkhcvv5/82t+dKO8Ww98h12RoabbWI4oofME8ekYki7Y
         SApovOssnPpPNHmU1vxJnEOzw1WYTUfj5VHF1m499KIeFJAFSrFRaaj3FKDePacxN0nQ
         gMjUK2K/AoMiB9E+G/5rX1vAAX8zRphMxKThTs+wLyJYGAt/3UoeUaXEo0EpG1Ui9moJ
         sU8FIO19SY5/AM+9fkufNG92CvEpzwR13R/2I2or+ScMxtl3RqxF272UiCgAv9Z99BxI
         q6QQ==
X-Gm-Message-State: AOJu0YygeScxoX3Fa9ybplbDUDvXJf+wk3988rWsaAdeuxaobi4gDNsk
	+Zh2N1NN37QKx+fooyVkAax6y/XXIdzEMjPRAn5gBLWVnxIcmgXzrihRvKEQ6hAfrq++TY0cQAI
	Gx7/+TxSUlhWkYSskFlE/UEgZPbLhQjH/Sbt7B0A63Zq6UEpxOyS/kgw15zVng03h1aaz
X-Gm-Gg: ATEYQzxSZrg8H/M5aJ5ALjW6V0pZ74UMRgS8uZtreJMa8z0qyJ3zrQxR3vwsGaC5CKv
	1NamXErPqZmOMfrfSGYJc7uMDdD2CfJcBx/nG92TrD01yq7mYLgrGopkhrQHqRBCRvL44ULxZ7s
	4CoMrIX69W2ySIKNzAKolDxyWu8BCXwyuTLTBHHMF5jbuw9d5rBs5JjcP+d5Fm563JWzNWn13eL
	jj6rY/S9U79IPDEQ2Imj+Eu4ag8v94mCZquUuFa0UPRYbV2TSe0Gyycn0rwYp7Ak6POMfwh66kp
	SSDtADa/hkg0ClUHUcLv6HOVPU1OY8Phlp8qMhbzOKXFNFzPC79gVAf8pJXKplPDx+Y+UoQWCu9
	l1sIc4B6nYBvQA9Rz/mS1D1SN5DkX26779arCL0bTYw7BUI4Ldn6boDI2bE/4gAFk2SvuJ/YEq1
	TifL8=
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1145193185a.1.1772448204182;
        Mon, 02 Mar 2026 02:43:24 -0800 (PST)
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1145191785a.1.1772448203785;
        Mon, 02 Mar 2026 02:43:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d068sm3249502a12.21.2026.03.02.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:43:22 -0800 (PST)
Message-ID: <a7c07d0b-cbaa-44e5-ba87-990d926d0e7f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:43:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: m31-eusb2: Make USB repeater optional
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a569cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rhpHOOLw1G9ZS_OY0_8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfXxQynlTT3DIQd
 3SlcL4ojvdmM0RYuhlK2AHjCM4VV1jMWn8s7khHAqwEcTpyUQZovpygUGGQj3XXC9Y5O4lHQuWj
 VleD/KC7WaOJ5qJIq/uKmrKw642PtWsvisREnXHORphPvgknCfJMJiYtTRaF1XtX1+854o9ea0O
 IRTpUERMfAsMBasZD69DluQho8pkKgCfKgg14YaqrCaeRidTP2e6jRPk820u50jxLb4En+f6hXK
 hE2NB8jV0xDDdwLByzxnQMi96QDXpdaSADMAkA3fV/ooMkwR/NEIxQ3wDtZmMh0yynQvqoP1v7y
 VEIIXTRw+caRlc+3vciQfb5qsg35jaxUPq+lwKot3/MDeiBw788/+HYE1/+mncDO/M+zTXuyfHN
 kQMNfO3NuM7f5efiwZWr+uy8K8rDGq3vjTOsInDB35GVfQWa4MjnOryx964IZ0+hLJ8vWSZYlMI
 s9c1Z9lwzRbPgqVEi6g==
X-Proofpoint-GUID: 1w10sqxMmGz5a_-upGQ-THSoHzIqS9Si
X-Proofpoint-ORIG-GUID: 1w10sqxMmGz5a_-upGQ-THSoHzIqS9Si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94853-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C428D1D6CDA
X-Rspamd-Action: no action

On 3/2/26 9:34 AM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> A repeater is not required for the PHY to function. On systems with
> multiple PHY instances connected to a multi-port controller, some PHYs
> may be unconnected. All PHYs must still probe successfully even without
> attached repeaters, otherwise the controller probe fails.
> 
> So make it optional.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

