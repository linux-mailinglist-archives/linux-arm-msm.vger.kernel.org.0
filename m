Return-Path: <linux-arm-msm+bounces-90731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGX/C4eieGmGrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:33:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E493A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DF6C30055F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FE0348477;
	Tue, 27 Jan 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yt2Rq4KF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqWV/qg1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029634676F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513602; cv=none; b=QI1BfA9ji4CAPQ8FmpleLB8RR12VshVBOgU+bxVueuA1M3d3Y3k/mdbA4sKD64UKa9PAkbiWSayOgYhGTrgjK6eOwUsO+I4mOnrW9fvgO5Eq/0Apuu6OIyVPZBf+Dz5rr50NTQerPTDiHCXpY0FhxbbaGkp75Xup8/gnFObIozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513602; c=relaxed/simple;
	bh=wA+LLjAn/JqZmxJSfDsa0fsJhBB1aHPQMAUOiZx0Nrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d69qE0rZM+tVsL+VbrXEuH6mNryQ9dtIGebs1vIzmgA5p1hryS5SWPDRQW+rUQ/Tb4/zBV2eScLYcuIZPv51EcSMsrgfcg56Ki/UclVw8/9I46AUCP0E46aquka0raE60qcgh27Rxf+06gIy1kp4wNWUSpENeFxQgaG5PTBdGvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yt2Rq4KF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqWV/qg1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9m7Kc786393
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5UFrsJlmEMjhkirRlXooFxQ2NogXuA5MgfcqF/u9Bo=; b=Yt2Rq4KFtBMupUop
	Jk1bY3pffgoDQE+lZrLaqy+wJqj6lOzBFht/sr8/2LkEdiNtFqswsD5JweF5ZPFr
	1VL0jS1FWvwG9kj4EDY0Qx9clQU6gCyFxVJnYM17A3QHjx7r0KUErnCDBWI6GAYR
	xorCJEbuw2GrNowm619EBF7bLNfsqEXvtnmyikyjUWNu2/NW2RGSy+ZA3U0G7zg5
	b8WC9WxuoQj4B1LQ+PzB0yKI6pPm7saSVVq93RQ3Qb2RLozxkLgAbvzMx2F2DlrX
	/Jh1X6+Lxb3/yCoTDGGEUsdisn9ayuOEWsF29IDmE9xEXHU3PKbLt423IMsOdwAg
	2k1GNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93jd36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:33:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c523d611ffso102054885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513598; x=1770118398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5UFrsJlmEMjhkirRlXooFxQ2NogXuA5MgfcqF/u9Bo=;
        b=JqWV/qg11eFjb/IIvzIGYGEc7m9ZqTPzpw6ZJKQ4Vjocb5hq60WYhK6alKjL2qWRak
         0IIiu19W5haKhL0RYqMujVeE67XusL3bOfjCzpxMfSC7OFWdn9IF2RO9Wkhl733IifUg
         nR6FpiETbOyiYL1c2yaqtvZlR9Yn29xMNK+7bNTLwoNTGshvH5bO6+MBz8OHw2YqCup7
         F46ABKYmofNSTj3So0pxB0FzcWTnU9du6GWCTnMapM3P/u6o2QzZDMT0D9zg3sMYt3hJ
         0aEG9ov1iPscTvE1GqPZr1fvYjxB+FcEZfUcQyTCkR4L982FBpNfv8Jx9lHu0DynaFd1
         oc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513598; x=1770118398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5UFrsJlmEMjhkirRlXooFxQ2NogXuA5MgfcqF/u9Bo=;
        b=UMaWBllaKO+vSd1OoRonDG8KF4oTb1Hbbu8Eu3/d/vP3fxeRgeUqrW3+UV97inK1C0
         yDe+s95onymE1KNCC6RTgy0YPyeqVA5KzgTdQ00lsrp9y5XxTzyOl0AhRgOpb0yox7lS
         vkHTwRmbiUE1gLqtkcZFZqYmuu9vdWD2W2yBs22vLgmNLdw7d/ZKBdlhUFfPQrcQ0NoN
         MsoC48dxpKtwu7nQWrHn36jvyFu3fgEiGDjB5k11DdC8jL0aR4q/KyXRVSgSlDMD+zqK
         l8o+p8E7oo5W2b7EYMo8ukGtSWyzsSKINlshe2d4jV64kVvmC6LQp7DADuhWjXf5/fDt
         aT4A==
X-Gm-Message-State: AOJu0YztESRZZu6Bxv0GezfngX+bF67ZGDxDuCDiGI3DfulyFymaefqY
	XoR27iPsd4JttaGQhRg9NHwgIjV8/Rq888u0Fi1ZeMYjcPnu/Atgp00HwLFaZ8lONel4hiizECL
	+a+eoc7ErERlTdD0PmdDuoYw20dNnqy13fdWQEf9B1nLTYSYr3wlD4LHZ43d5sq0d0NUv
X-Gm-Gg: AZuq6aL/K1gBrlqGM3zknhCBXz+nQQVmPvpScHqZTIpwgRUjG27F2s3kGvINy0SyACJ
	BPYKGPR7CHIz69sVHTItnMFe58gXM8PW3J2Kj5gUDStbFa2+GlD0yOb4EOyA4iMY/p5zlxmWH+Z
	QFB1fLEkpzXURQyOLI4s00W7zsPJ5q+OtGEd6v0QKVoMsw5MAac1wD7HVKFFiMjx1lB1FCsrxk/
	AYFUi6pCSUQhgoI8zfdUiNE3jhH9krg4No5eTmVbkmTScjPaRdvTSQVDM+61JcoPQ57tcNkxvqM
	+M43rVoCFFK6/Cq+gstPkEVQkPMSG93cbQRPJbxz+azdqO1oK6+Rh9qti8YRytoS2Chz6I7SUGu
	nJmDVGOufJiXtYkBiyMd4M0BxRckYXJnoJaSbBokdP2yXnoXS47KcjMya8ErSStJlq1o=
X-Received: by 2002:a05:620a:7014:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c70b939a85mr113301685a.11.1769513597865;
        Tue, 27 Jan 2026 03:33:17 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c70b939a85mr113298885a.11.1769513597347;
        Tue, 27 Jan 2026 03:33:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8af61bf723sm576003266b.8.2026.01.27.03.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:33:16 -0800 (PST)
Message-ID: <be8dc80a-7943-4a2d-af98-6337059986a9@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:33:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Mahua SoC
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
 <20260127-mahua_icc-v2-1-f0d8ddf7afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-mahua_icc-v2-1-f0d8ddf7afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NCBTYWx0ZWRfX+PY586diKrhy
 OQLvy12gDAi4oSVn6Clw1+hAtV1nTZPr3Z9CxiVUGZuEVFU6rW9HQ3XdxbCoDJ8GZzwcF2K8Jwv
 1SPq6AdemFWMX8/qVobWyELLMAOmmWHjuCCeu2S/ZRWliFkIVfE+rHBeOm4DH5Q/RT2sFYLnw7k
 Ew7KIr1mNQOiIK13uSIfF/MKsW2AFGhjBGYBxO35lPytT1PLiFiG/rnFe5c5nOg3ilMH8C/rsaM
 rZGtKTCHfFXrOFf0S4DMtnA8ev8TMwJzmTbuEqoyW5ovzKHd0II2p7S07OQMJ4Ljf68JbVpR6wO
 OY1VWoDQ1xfjH9IEJbkp2heFZG8ZrlPiaXVB3aM+cd/WxO/Rnw5T6aa1V7BBd+eipndUB/8eUJ1
 QfKNt9M82cW0GatXipRUx5wyqOQOdOOAscaUM6z7XtTAyj9xygxa8l+MyLOL6jko3QVVKAROVl5
 lS7diNo+aHABShIf9vQ==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978a27e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rt5WFD0YkmQnycq5PrwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KJSPQh6ARuQTO9LyknWOjwuKiID62X2H
X-Proofpoint-GUID: KJSPQh6ARuQTO9LyknWOjwuKiID62X2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90731-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C7E493A2A
X-Rspamd-Action: no action

On 1/27/26 4:22 AM, Raviteja Laggyshetty wrote:
> Document the RPMh Network-on-Chip (NoC) interconnect for the Qualcomm
> Mahua platform.
> 
> Mahua is a derivative of the Glymur SoC. Many interconnect nodes are
> identical and continue to use Glymur fallback compatibles. Mahua
> introduces SoC-specific configurations and topologies for several
> NoC blocks, including CNOC, HSCNOC, PCIe West ANoC/Slave NoCs.
> This updates the existing Glymur yaml schema to include Mahua-specific
> compatible strings, using two-cell "fallback" compatibles wherever
> the hardware is identical with Glymur.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

