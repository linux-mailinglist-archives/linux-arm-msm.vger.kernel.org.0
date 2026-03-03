Return-Path: <linux-arm-msm+bounces-95116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPziFH3Cpmn3TQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:14:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED31ED8D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 12:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 657763047BD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFA13D3D02;
	Tue,  3 Mar 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gilUZE2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKNAK7fQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E733B7B64
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536442; cv=none; b=Hmcn+9sMZJl8bgWFyXfklI1dXwkPgq9iRXwxRl3MfSmEY0+YKTCq5Al1QCFMeYB2bL9bcDq292INxy/8z5vIQijqfoeQy9S8INlJ+ARwvbgmAKwR3zcxchVpWGe7wy35tOpF4+rKX9FO+xEvU8VBYtKTyqjowgY/mNx7CIfShac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536442; c=relaxed/simple;
	bh=wWFLYkNKMAA4PxdeoBoHTzoSaqj1Bb+Ww97iGeWOKh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQejKIoFVrdeINb9vW5uqEhMgvZXIg7kaK6EjRaGEm5ang7Ha7oGefaVAYwr+cumhax7smgqJBRmv6mmiGd7buZ8N8mqwXBaVT/XGnfdhA193rW/5GnqpSV79Z6kf0U03tNSnSmMgv400OFL73fD6BMhIskj4bkyN6RpNdg2rQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gilUZE2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKNAK7fQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nLEY324005
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCgwoQ4wtLHPObZpj50Yrfw2f8i6XdlQ8XsLRNXHaTc=; b=gilUZE2+duyHownw
	JYPEeG1A8x5kEVnGJjBpl5ohdDY+16BBqtKsQzWSFqBxnGqQ5AO7Qs0CMYTysmmh
	BugKL+AQ91C7vp5ubgiOwknA17PQODgFcmntaSVd1usCIKyBQEwBZ6CYmLD1Ivmm
	LCUmHcEjdq02xwkeJzmG7vvtVojMTWf6qz3XiHXizOdOMfOJVyxrqNDl9S3ovDCT
	3/x4JtZ9DLEmj0kZ/A9dRkM6eZS53dAsfR6opcI4HRlWufLyes+Xm4uNuuYHn5sA
	2tDivoh+Q2y2EewZxxA5HyyZ1ljmzb4nRRLyFnUPRjLiqZiDDBbdPkuffntia9xO
	LvezLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfuuwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:14:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35984b91ffeso2278967a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772536439; x=1773141239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCgwoQ4wtLHPObZpj50Yrfw2f8i6XdlQ8XsLRNXHaTc=;
        b=UKNAK7fQi2qFfG/EuHo/U2V/7HwFoaCTktKD0KA3X+naC10L2FZqwaOiP4g014kp41
         oKjWatiJNNB/ULUx7mAt2NEjDQIUr0P5sEq0XUUqST2Pwb0xl4C6XhUpmcs99wbsOusf
         MtXCBpphfQDgoYahUup7ZTcLN5R/HEgpF4OcygFEFgk484xtEWIqTbuuJ7ZbQRePktoY
         qzlPBgMeuGXKelp1jKEinV8ssUJ2AR0jmsuknM+8cNooQOH8Tu1zL23IMpi8vigSr3x7
         S2xx/0moFtKPvoN/BFqbF7YPYEAywK/garUuImpceyu38ZY4AWY/FH8utZ7TQQBjcy3E
         3OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536439; x=1773141239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCgwoQ4wtLHPObZpj50Yrfw2f8i6XdlQ8XsLRNXHaTc=;
        b=MKIcaS6J0jJ8k6uyJ9tOTudvt44hgMUvphXQRL4h3vsSLz5gsfH+33Wastu3laB8Y9
         tKrQSNHS+DLE9ifkEYUeMKU6hOLkEbM1Pn2J+PZOlkc0uI1PIU4w8bmssg52IPjverdp
         gvgCC+YykugebJ5EmdEY/J9L850ttZJmB0UKIMQq3Xf9PxgKOJJWFOBkDWCvXyTg0A2a
         GG2AavT7V/RFIISM52MBEU5S5CtmSo/7iPVK/HP4XQqYmaHjodGCiZBtSiSYjhYbsQST
         FjTzQqj/HBCLT5f/JaIrNqM51deG02/bpi7Xey+qJ6BO1ME/qHq/aFRVZY/l0ZYmtUc8
         3gDg==
X-Forwarded-Encrypted: i=1; AJvYcCUyc7ZEBLqjv5UIEGZStk1nlcDiCniRBSMJhl7lEHkGR7aKOWgfIN90/Dqj8AFWxOZhi/hPgsnc5viK6Xai@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEMJPyGuP21zJVkdGFEHrl+OuyXkzCK/ACPLCmqKqwfaj5c9x
	TumDfPdErALJsHmdpivLhVakggPYAy71xPw31CtbrMmr3O5NpvD8wNvy49O51nSrXsltOrXPtPH
	gtOfcx4EKUGm1jIWbBfFgAF9z1vQjfpGvfWzJK+MMzcX74IJlavQhR5qcFEaVck+HTrIA
X-Gm-Gg: ATEYQzzJWesZfC1JTlc8ipwtB5bnp6WwNN6eyGtKe605qHHyRw50D/TBaslXLkNRFsc
	bblk9Yp8pta9tNk6l1dsAJ6Va3e6zPxcN69KZ3YP+IOaRJ7+jen/UKngimEOPHgXhG3HQFuMNXQ
	OmAHUUSkzv8MyG9zOdUuN+Klbd9+ZdZ3UWrNXMovluDIhjlaOLEjwQYks1gWi0Qd7j1DE3IP8Hy
	qWnbMeKdm2pjMdGy40fhp94M+WIrCywFVtMJxWMH3yYCpOcVFh3Q/YKgjwSrl3mQKU5x9mXx9Dx
	aTv5r4gIXwKShUyGusBs0RxNSQ2h3QG+bNfuDqbZIlnqDnOteINOMumbgYT/vpLW7J6o+O5CeGk
	Bmin7iePrmY7sF9HlHYrM1NXrhdS57jQXN7L/LbCJYV/vnmwH0cHpr6zy3QS3NeJsFyB9iT6899
	Rcn3bDH/b9v8/1
X-Received: by 2002:a17:90b:288c:b0:359:8c3e:b0d7 with SMTP id 98e67ed59e1d1-3599ceb51f3mr1539489a91.11.1772536439536;
        Tue, 03 Mar 2026 03:13:59 -0800 (PST)
X-Received: by 2002:a17:90b:288c:b0:359:8c3e:b0d7 with SMTP id 98e67ed59e1d1-3599ceb51f3mr1539454a91.11.1772536439030;
        Tue, 03 Mar 2026 03:13:59 -0800 (PST)
Received: from ?IPV6:2401:4900:1c66:bc62:9072:7b6b:889e:887d? ([2401:4900:1c66:bc62:9072:7b6b:889e:887d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae541358d4sm51477085ad.75.2026.03.03.03.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:13:58 -0800 (PST)
Message-ID: <841f2e1a-f542-4ffa-97d0-e3f02791d8ff@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:43:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <ayk53t4tjes6gq2m32e73tll5umb3fvot4keqxnfi275xeglvq@cis7h2n6j5jy>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <ayk53t4tjes6gq2m32e73tll5umb3fvot4keqxnfi275xeglvq@cis7h2n6j5jy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6c278 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=YR3WsahE5DL5jeN3REYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EEyKbm7dSl9-j1WZipG7x_D51HuAXT4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NiBTYWx0ZWRfX+22ZRMTIIf+B
 EkqV4kkZLsEBbIpcl+M+o8rzscZ+NYhwImu7ke1eB0lYHsKUo9mR7zn4lPgxy8rR2+YbyG+9N2P
 SyeCWlntHzrVuaW9dc/Uuzyvu8RYEj+lJ9UbGuIBL2zS2yLUVOQ4CCLebfeeqCiXFUgQp+a4Oov
 TAQFNvfInSHiaSlUpYm177uuBI+h6bQvLIi1q8aAQHDkYM89tXzokN99g0umkIUhsolPu6phPM0
 EopCIf4/2VzkS6VyviBhB5a8Kxek34ZNGCmjnbGdL27+J5Y7dwHE8W8h99ssi0L7zHLs5rq4EEt
 WKWwgoX9zN5xPkrelcRpAljGqdLH2DoYGkFSnLkR6h1gnSCI8ykGXc45Fo5vx6URTRGrTRqmbJP
 HgS8ugnUH8NmlPinebyPh3ZfJl41stUCU3e7QRHgY37C5wCA3BGSENFTADcpX4LgmJyvzTK1Bjf
 RFbvoc6lDBEKlxzojsw==
X-Proofpoint-GUID: EEyKbm7dSl9-j1WZipG7x_D51HuAXT4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030086
X-Rspamd-Queue-Id: C0ED31ED8D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95116-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Abel,

On 2/21/2026 5:15 PM, Abel Vesa wrote:
> On 26-01-23 12:41:35, Harshal Dev wrote:
>> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
>> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
>> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
>> and the 'core' and 'iface' clocks.
>> Also updated the suspend and resume callbacks to handle votes on these
>> resources.
> 
> Your intention here is to fix the patch that introduced the ICE driver,
> so I suggest you add Fixes tag. Same for all other patches.
> They will have to be backported all the way.

Ack, I will add the Fixes tag and ensure back-porting.

Regards,
Harshal

