Return-Path: <linux-arm-msm+bounces-91825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK4oIF53g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:44:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD497EA6B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086D33015462
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2033831078B;
	Wed,  4 Feb 2026 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYKTtLwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCXARTEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B431062D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223140; cv=none; b=DNoq/b0jszp0sdPtM4P0VnPhNL3SGvy+M9WlA9x/JsmS0PCfk9MATaUkO2dA19+zFfHhgJVaDmlBehllHJL384AS8Joos0qoMlDi5KPMouxfx8TQq6zntLAN+yL+UlwuJXYuRx5d6m/HBR5GrOQn4nkHDFcULaH7IDOmDX6KVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223140; c=relaxed/simple;
	bh=CLXZhBKhN3maLcFgh5thcSo9kFIPXaIprbv/R7G0TfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toadllxpYibZc6TvAckY/fLIcj/GzcHAepmVxm1RWho1hHxMPv+mVOCBWeZ87hwINAsPwNVD0LaRp23Lhp5LaUgWvadW/dznHw7eC2FDhJPC5cjE7mfFOMQLofrTDmMjbhw0554+hSI33xrEyDFlSemYuRdnKMgnAvXu92y6epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYKTtLwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCXARTEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIUfI899194
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1Iffj+H2jDf8Ae/fhDoY4kT4z6q0W3uyYv3Jd/Ctng=; b=LYKTtLwFYVhbQVg+
	aQUCZ41ln6iY5S3qYSr/Lcfxn+h1Og7hE1VZxKcxU49GDszT3r1rXMpUYgIzHoTm
	yeDUhY+IIoZAKT9UGP1tUQdKWlw8LBIt/dadLmwS6B5Wv3VNxq/JpLK3mOUiKBDK
	J9S7tfrAOoz/7s+o9F0sMDfxxh6rBX9sztQQ+PIukj5OyHMtRI6rNo2jW6KK85qH
	whzp6or+jS9c6VH0/ard1XY5MGK9p1erboyAE79UcXGVc+9F98cHU+pPSaKLYkRE
	qV44DnRh35SnnuaHaOwDqKH2lXxcGgjHDba+O7dV40IuQSX84eJ6JX+qXsIZdWVG
	m2AfDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445wh4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:38:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so186861485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770223138; x=1770827938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1Iffj+H2jDf8Ae/fhDoY4kT4z6q0W3uyYv3Jd/Ctng=;
        b=kCXARTEclM6Qdn5FVG1EaWGJ/tloMVzHl0Upb8+tCEnEOHCToooNhG7r4q78282EHn
         g8k+9YyP5B8OkeAMqgc+UxjFEXt+SDDFayIv5Z52ymjKKFWmjY4ZT7DHrb6+wpuJ8M3a
         H6QjcUMJQk1GQ10VeFDjTL0qlQoyUk4c3mqPwpUjEQ4kw6sDGeNVNpRzYUvqxitgzICn
         +x1S68+FCAbE0BlXMmiSLOTZhbU32HgorwtcF4qR4mGwcJsYCoOdg1ni0/8R13/Xfj/C
         thEEeSV3qdJzu+WEKCm/jLLmcnfCog/F+znst7P2MOHkXlujfvbK9h0a/Vap4wCDQ4CW
         Zi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223138; x=1770827938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1Iffj+H2jDf8Ae/fhDoY4kT4z6q0W3uyYv3Jd/Ctng=;
        b=vnq+bIFMiu+ygq3BM7He9+PLStbmD58A1Lzw6bNFjzwehwn4ovr0u6hD1wDMtIe5Au
         ZP8qcL2eYg4oGzr507tDsaEBw7/Ga1ltFntnQzpapglQaF/OGCZHguonVg+dK7IUVk+x
         HlOMUUcjCuSRZ5PChjQOCrjQCXL/sHC5FO0vi0TPeywdjUposRKT1xorNqh/z1tsoGiq
         P1uvDaHREo+U19xiaC2v0hzDoRI/TAxMsh2iHEAuh7QRbb+P0CRFsEu88rN1VqeEu4sG
         M+Pv+wphXyRKarzHriPv/mZ81jcW75gG7VDTixYqPuUHnQ6lHYFABxMk5ezggvEobM+h
         5t8g==
X-Forwarded-Encrypted: i=1; AJvYcCXxixQMGp54u0IHnsDhie5A4EIpugTIlEx8SZ2sGwcgOFaDbniCiW3eBz1BxsSQKOwfYfmuWQIE1DsN8s0y@vger.kernel.org
X-Gm-Message-State: AOJu0YzIBJ9krfaHQO27P6TnM88kAeIfQjio38FSX/p0WJPqxqRkNlPs
	ecN0xneRtJTWzu/iJmRa+Hx1SlbcBtQdGS2OeG9liXVtJqx8WEbUIj4dgFUUBWnayw1q6EjdElx
	c3HPxGzuAfmcF2f36tWOm0pJkoq41ek+2fZPjXQ3ZQL0BojPiYTe/QzAPHqlUxrLA7Mk4jFjHC3
	W/
X-Gm-Gg: AZuq6aKO6GtjoQP9kXNVlMrYJWCDV0gXwQUmJF2GYbPVZXF2clCjrCNQ8z9IVzTHmr+
	2QYuHQLroPjmQEgms9B6kZdON9PccFdoa2lB0DxCZVYq3vKScvK3dMKKHdR4VHMvcM8247wYXBo
	BWmBBlpvtKOS2dQcVuyC+KqqhXIy3Z951NEBvDRLBjAcsvbd4YdOvfwSLhzx5YKZ0A3k+S5hOgN
	rNLrIyCMrJLtduQS8NreumDnovF2FNAkAan42aNMzQqpABobKG0HmuaxJIFydb7niDATSEpGFe/
	Qyy1FtKsF2xw0WiYFzXcQ/xkpo5GD5NH7QcxNNbpCtCM+qoUaNF3sEelhY53IEmSron7EnUQhV6
	Qmf70dXHH6YxhWP1gCf/1ZIo4nf6j195fPuKyuHNqkpN5dvAWM3yr2+C4ZEVxUY/7GTs=
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr373105785a.2.1770223137976;
        Wed, 04 Feb 2026 08:38:57 -0800 (PST)
X-Received: by 2002:a05:620a:3943:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8ca2f822612mr373102685a.2.1770223137436;
        Wed, 04 Feb 2026 08:38:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fd47de4sm141247866b.29.2026.02.04.08.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:38:56 -0800 (PST)
Message-ID: <dc28efde-1a0a-4820-af9f-4ce5f5ddd05e@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 17:38:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] spi: qcom-geni: Drop unused msg parameter from
 timeout handlers
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-4-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204162854.1206323-4-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfX9RUUkk6rvrG9
 zbxlSgK8Y1KXEkIEhhnHDn3ecEBijXRN9xkAa9APEgMfAs5T4oSMOFCpCdQFLql4ph05PDMLcVD
 jp+d+j3gWhtc8C2ulYtikNthHb4tUR7tpIuFa6WF8v+yy0Et+CumdMrOCYVQfVU7+9NqfhwX1r5
 q/DY12L/BpsC8Nmq9jmnqld3ignf0eyJMynpZfEdVUji0xo5FQq8zEvINJpApCkvXNDh+zF4kM3
 twzODlIzwcnfwCtPteRfo7X/QiZkxkY6gkbpFmXCMqL172jePbk8WtMWqP5sNFzjf1auh5mvPh7
 SOhFqdlb6eXNB7pbqBXlhiR/vMgbmS5gQMFsGFa3Ndz7uWdn8hnR6TzuiL8srGCSfqGHpgNPBWy
 u6XZE3lEzj/2MthGqXV6kjTWUSZh1czDs7NPoDAgSUXRfPUjvmJ0mVO8QLHBfhRNTzDjHO3CFS4
 GsOs9D2aDkFwi4U9FFA==
X-Proofpoint-ORIG-GUID: JPKRn-2w-CpEmnqnv_f4Bv4DCiD-YlIj
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=69837622 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1O7fFdKsa9_7UK1TUcsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JPKRn-2w-CpEmnqnv_f4Bv4DCiD-YlIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91825-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD497EA6B3
X-Rspamd-Action: no action

On 2/4/26 5:28 PM, Praveen Talari wrote:
> The timeout helpers (handle_se_timeout() and handle_gpi_timeout())
> took a 'struct spi_message *msg' that was never used. Remove this
> parameter and adjust the callers to simplify the interfaces.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

