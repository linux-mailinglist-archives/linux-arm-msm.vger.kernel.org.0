Return-Path: <linux-arm-msm+bounces-97000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLBBM+VvsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:36:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F5264A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A8533024184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E168731ED7C;
	Wed, 11 Mar 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jD522WYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibCn+rHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAB2E2F1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236078; cv=none; b=g2TcCTg5yXL6L+4BpX4IHYn/97WymgBeAZpssn8r8crwNpfBwmyLzoAovJi1cpNyiqcB5ZTmhz/WLIVHb+QxDI2wv9OnAl4jIxpVVZ5rVtgK7lE0xhceEjbNxH7FB1meBdnG01qY/MkD4AK6HztP+SX5kVXmYZ+xsDDl9/yFGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236078; c=relaxed/simple;
	bh=Eyb/s027S3nbHlmPYwW2DtYUUB5vt5wFvTp5hMvzCDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRgU+ibKIguSS0ucu6N7c/WZ21QxqX0sLnxRTUdSre79NyJIC1y7z9O3fNNRhthcXNGDCxoUydwyr2Df2z7QbVPfdJAybCdPGoDgf7vkyadZrd9GLYe91xo/tc5RMYfQC6ectzi3q3UjZCx1W7Fw/gtr654200Vn9wTDX1ocxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jD522WYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibCn+rHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9mdLX248220
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cro7d2Qc55Y99x54Bc3qfwkwfUoRDVh/RrC5sik6Wk=; b=jD522WYN5VWkBukn
	ks5I1szzaA70zktpN10PKqW9W2pqnelX40TZArGAqlFGNb+2/4ajHonvSfjcHqu4
	rIYz28mEeVTl2IBxYfgRUJn0yF3l3ZSbCWOq/frFpXlQoMECN3ZVtWc2/ne2njyi
	8JNu/Q/g4G4N9vM8notqpQuCC6aIIcWhMgbUlGg7+FjtHM7J14F2Ki/a3EUwhY6U
	czlMNGg+ay+/T57PhGiyV9dTgpHhfIQ8/O+vdNjgUCnGCadYzMiQ5MvGg53msH6/
	NCn5cWzMpwiceBPL+me40sjekUC0vAq33odhbng9uS+SldrwTUyKlKAfyeHYbgn5
	bHhw1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv13qx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:34:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8dc8b434so214107685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236075; x=1773840875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3cro7d2Qc55Y99x54Bc3qfwkwfUoRDVh/RrC5sik6Wk=;
        b=ibCn+rHDn1NwDbgLG62f5TZ+elICBzV398lxv8VREnVxXUx/V6BhZDygYbr7iFuQjl
         ynloWKUSb6QZ9eOEBMBwHwkon60y2kXacZ/Aqm+LKKF+o5chctRDKpZAnLH3gsuJGALI
         1m8gpGkWl42ueWtQfjyCsqgeR62ClajzBIFilKWo97l7yXqbaH+rISJah/xKYwLXvsh/
         dfj+D6U03HwklGMc0vcpFfJVkUyhmaO9l7CXVarCjOV0KS4SiQitJakSqT0Oe7FWd8ep
         Goqoh3hTcRXoF0CypYO3UXRwXjahJhq1kN8/e6ioYK/HhnfVsxA3B5V0SETXqMLVvduA
         6u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236075; x=1773840875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cro7d2Qc55Y99x54Bc3qfwkwfUoRDVh/RrC5sik6Wk=;
        b=o1uQV+eeSSTcpbuus+I2F80PBBMxUWZzZHpdVl+MyGAuK1i61LTu9SLW0wcpf7mDvS
         HoCXXSmXL+Gqob24kJd57gRKi7ScFabNvofYcexso0tb6ykwgAqRAVz7jvjZOd+WEYJy
         DnV0kEO3Q/8lZxuaLYricOKiOTBeQhb69ATLfw6eehbcOQhkvfM3ABFb527WKXN0g9m4
         nh/ZyC0CJ376x1SA6sGj2gtiwRIZ56seRitbYuXqQhCfJNGSmkL/uKhFW/5gFX9H7yx3
         q7ABG1G0dhX5Xwds4MKHcwFRU6tGANCl5JOLG9NNrqW1QHQUPKJ02cuC8GuUm5T+1bY9
         IZag==
X-Forwarded-Encrypted: i=1; AJvYcCWa6ir8B9L/OCaB2hsKxKTKQsF8ZVEeq2oLHcNiDIj6KPcClEMMAqJr8433rf1rhVmNnov9REfIaXY3/Afh@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMVrlADCnW490SBzkSEXEqswX/V95RpzKUD5b73RMAmI+9pYh
	h5KZHGBFJXvO5RTTOXLSkNi1R14vOzCySjBlzAhq1VIojrFE16MjLYVrIjbYYNRah1M8w1FFZO2
	M9eVtMdihzU/DHwgq8rniJDM9GKiX7nB6bN5DlKPtlN9Io13lAXkc/3lg40+rpgnS4kTL
X-Gm-Gg: ATEYQzxxyc5wIHcHlVD4T2lrNb2CTVEfFMK9ImT8Jt8U61/4UbIi61A3ljVi5yLTh5g
	pP+NVANdFS1g2Q6h09OV6HfVvpDHEy1hPDGU9gv1lPSXnPOvSVqZv1Ojb9J51UVtz082iD6Tymb
	2yrf09k0k5meSW6pQ+99r5RooMZ0t8A8WRFL+1yrCU3iQyh3kiU74xGC6aLiSxsWFYqXTRF21Ob
	uxoyBxKbyW9dr5MTeO2Qe9ThI7rlMfOS/FZMMUXUz+99muuE8Gg73WCc8EU/ScztQeI4SXkwGIj
	KX4uh/K1x4v/ZqPjIyhicTbXSvg6kmTe5NTaqQzDaHkaxybboFRBi9jomds5jFv9K/74fvlVm1U
	+ZasDM4QbCriVl47B1gTxqCJ2Ut7mw39oJhLs/TTaKzjBos9AxKXogmHx+HVhd3vhVbmgNoViem
	ARjU8=
X-Received: by 2002:a05:620a:29c6:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cda1a120f3mr232197785a.6.1773236074938;
        Wed, 11 Mar 2026 06:34:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cda1a120f3mr232194785a.6.1773236074499;
        Wed, 11 Mar 2026 06:34:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972db9fce0sm56501966b.0.2026.03.11.06.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:34:33 -0700 (PDT)
Message-ID: <8d585d53-ab3a-4302-b0dc-8a9f21690cee@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-6-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-6-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX6kG86aUW+Wr8
 0V20NAgxSN2rmT9SKbBuxFRXIjvszsFyoG/mEHZ0xC6D9V1PK+DH1dovECcrTHdAXWhbATIroOZ
 KemNpuq2IDUb5J7U7a2vvUOoBo2EgR4mrN7pVSOWFsZSZNqDsJTHALG4H9gBlEZvTlHUTz9aHqS
 8wG4aSr7f0c5w1fpWL5C3QTljx2x1vqFfY/Ezojde2PUY2Fc/mgMKuabYgRs66Ja8Mmv11xomkz
 9GQiqK/wNo1elqbeNbkTEXfW7wzMIEcJO842e9aP76+4R+NN1gb+axIEHgbXksmf6FFA1srv74I
 DUpQ57ClDFmYrYiyGwrSAh7fn7gsuD36VhfPQrgpZ0dv38UZsUGwI9w4R9U9PXyDemQGs2ouJeg
 KvRi3gEolZ1HKdYFcmPQQOiPG+d7JGtitix6N9PdjAOm803jWiohBOX/9JZgmgARLrJ99rE5e9v
 lg5pgKVD+GBEdKV2Ylg==
X-Proofpoint-GUID: xABM1OpIg22di98hd5mOxPyUV912nWll
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b16f6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=W3I9JGv7J1k6QNzkgEYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xABM1OpIg22di98hd5mOxPyUV912nWll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114
X-Rspamd-Queue-Id: 840F5264A7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-97000-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 7:15 AM, Praveen Talari wrote:
> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
> activation/deactivation sequences independently, leading to code
> duplication.
> 
> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
> power on/off resources.The activate function enables ICC, clocks, and TLMM
> whereas the deactivate function disables resources in reverse order
> including OPP rate reset, clocks, ICC and TLMM.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

