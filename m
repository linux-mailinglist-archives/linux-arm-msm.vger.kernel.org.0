Return-Path: <linux-arm-msm+bounces-94089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sElNBCDfnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:38:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803761969D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7850E302F255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEA436215A;
	Wed, 25 Feb 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSCWvc3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4gwwuqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8432F394499
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019267; cv=none; b=O5gKrGO6TBgFSRysE3BtaW+oHdLE/K0zJ5tWLGCpGp5ctIx2GOBYfNtzbVTpqju5tgiANd2GB2X3+Nosuiss6u/ennASyZVJb1ru8Vx1swV8DebUuFCUfk29XXSD5bi11YwFfZX3g2tJPNUomir0xQZ0pWn2GXShE8waTKNHoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019267; c=relaxed/simple;
	bh=iop5cVSDdAoQbalJdBORgGZ2M48mSam7dmcxLyeP9tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+PzgxMfbKVQcIFv5+R5ViDRpxvEIGK82qFcPpwyKQ2YvTMSr1F/lQZe3gq0EmUx+qaM2ysUzsj3REabOFdYMcb4inMhBMuCZOGvVkrL4nhCAOBvkaqqxtUSJ4HbUTC3BFZoqJX61GJrwMUekL8OxkH6ns+C0lOdvIkk5uofkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSCWvc3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4gwwuqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SK1o1025033
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxCNFP0JSoMDu9DqpciHMjNOX+Cm3zuSGrVP9fh5i6U=; b=eSCWvc3pCJ6xYTrk
	Bnb8muvNkMxkgM0LbEcP5aJXitUWIgF0KjXpOp2KR6enOtpczCCTzlZUT3GUlMaw
	GqP/3RhrN192YhO/mZJroosQad2e2V3KA3+FFB8GDdui+lwqWFcl3+/qZ1dyZ8jc
	0qpmpK6TM35R1Q/sprGaa51irmb3++xWGfKfj3LVzE9p5ySY2N/IJtH0onjZdEej
	xGBGxwfZUntm7BJ8ftV8MStd7hi6KX3e6y1LE3ktvT7F4PTCDEdxfDIpEC/EW4kq
	jlZEx05XYSEfrP+aGEZdfByP3PDqWfHGzCrzBxMS+QF1iIziwazpwkS2Iomfw5Le
	21SxAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57smdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:34:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so604738785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772019262; x=1772624062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxCNFP0JSoMDu9DqpciHMjNOX+Cm3zuSGrVP9fh5i6U=;
        b=C4gwwuqOeFs5BPje944Q1H4yDQlupHrioItU3+XCyLSC8MYOUTBfQHT1rlgV7nx+1b
         Pfz8GgxVCeVW4S+WOXiuMVKLM/lZPdXx1CetsV3hrfHGLsz5fOVppDMmdg/moO4Q2gsg
         mZ1LecffxLwt3mUxxj2Gx1zb8ZkaYU+HmpJ43ZVlUqFitK+k9pRw5qnsySQZRMVbBO22
         3lsc44/bOIE+jFV7nUTLsnHiRGvXNNJdwo/82WdzEZB3WgG8Sj8Cv8R2AcaXt99SdTHb
         40HAu1UsTD/TVsWQEiqMMU5rSXvW/Knqi5w2FI76+EeCdklmhgfKRdofJQDj9ouJifzS
         s7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019262; x=1772624062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxCNFP0JSoMDu9DqpciHMjNOX+Cm3zuSGrVP9fh5i6U=;
        b=RG2mvQziM9wgd/02t6XM44FFshwg6wO4dhbMwd3t8WAriqdWK0FCk0eEsoNesghTBN
         CKtLfMjR9t5Gr/BbooBQT76cSINpIlISjVMsVozQtFdokJzw8UzDdFZY56UVUBBB826q
         PdSN/tEQcKc2HflZ0CrtEQNG95Xr2mYdw4QiKwdzi5dU9nKdppJZWSz/eN+QHs9kSHht
         aEm4tFnbvMQX5W+Xr6p2BJthMKzedyQDkXwR2zNZnU8vRecZjl4BCL0+VYbiZooDYEK2
         /EOvTySRCHZMpqW0LBLLbd1p2UzGbwFNs6Sen0GORk6Afm7bu4vYeGW3MAyPq4KfNth0
         CPQg==
X-Gm-Message-State: AOJu0YwZGnNQ2sx5N9qQVGROqrz/kAyed3l7d68NZ6QkQNWf8MTj4uuS
	BHOmDlQFN6zI4ZarD416gXedR2BD8owO6KCOQEaL/OyDRgEIwgcGPhSysM+I1MYd1XFkthza3Kk
	iyJZUuRnNunYYf7Hr4pFyz6V868CnzDy6YCvRdt/uR7NLO42JmcShSemXyH1Oi5t0ub/h
X-Gm-Gg: ATEYQzyeCVvzP3gF3J7agaQQtv3chPAbt4+TU/oKl1Z5XTGTpTz1Sc3s4ll1FfgxRsE
	tu58rqAKnDYWAiZGIuJ4Os6onupzhncUSq91zxbjEusjRbpqNkLjP/8GUX/c3TZgiYjBT/qwZps
	p3wuJYtkvR/sMNDTDfT3DopOY1phjkK/2UZK7XRgAkxATlurrwU2qYNE3tsGFD/PQtALqK1U7bi
	EvctITnZvcNJGiko9XaXvDrB81Mz2qUryRwI9Ry0zR/V2CBRfhRAuWyIzxQeZ/e7A6n+s3ohVrO
	8TeHhosI5aPhikIF0d1aMXD0JNixLggk2xBw7iZmohpe3zuHAS4IF3a+LO6wrTH45skAswUBEYj
	cfPiU8hm2UiUCYdfWjQc8o80ihfdLgtTwMti06yYoA/Q1KWjMH3lAhBFnghRNwqEy7OBu1Uj7k1
	pQWHo=
X-Received: by 2002:a05:620a:400d:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb8c9dffcdmr1595547685a.3.1772019261632;
        Wed, 25 Feb 2026 03:34:21 -0800 (PST)
X-Received: by 2002:a05:620a:400d:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb8c9dffcdmr1595544985a.3.1772019260966;
        Wed, 25 Feb 2026 03:34:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65f6e6b3dcasm1098893a12.25.2026.02.25.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:34:20 -0800 (PST)
Message-ID: <ffd47ae9-af7d-422e-9b92-fc0f73f4dc1d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:34:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
 <20260225093155.4162177-4-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225093155.4162177-4-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ede3e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SlDqxh7qNjBtjB7fBNoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zVXD_OW2Ei_6RiZV5aPcyL0xTuWVMw5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMiBTYWx0ZWRfX/2ylAn9nx601
 IyuXhYBWdi8KTa7XCdML5/YJQHnArllOF4q5JrTvuQ7ZHswHaGaHeMhi7/ZRi0AsP0YjU3OZ/qB
 y6iwZ4CLFM3CuU2BZwoAQ5OeDSr9/PN8etF2CLpAU0t/vg8pEv+k5AzVhrfaLy8hZrFgFIS5bnG
 8T+flINOiTbdF3QLi+xf1gGGSnsu92eNwQVTDzjJol7oahiuh+gdsyyq42TvpkqnVQ6m6hgJSeO
 FJ8ajwqjXdk7S8mxaiunZg95/o8pNtUPjbhMFlJzYynSEMuE6T/IUO60TXXaZTl010QBejzM8JJ
 103/nIpHuk+j9hA+5NRF1P5mN5jKDMVh0Qh2vnMLY1xbHCbwIl6RRsG3KpMYdb30In30k2D1BD0
 PFx1ybWJExU7UovkDo20PvuqKOUA/thsr5DWIfGZiCCaFHzBDUmc7mDSV/KeyvspvbgKM2PTalN
 jOS9Pl1L5l8Sy/Xle/Q==
X-Proofpoint-GUID: zVXD_OW2Ei_6RiZV5aPcyL0xTuWVMw5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94089-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 803761969D5
X-Rspamd-Action: no action

On 2/25/26 10:31 AM, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

