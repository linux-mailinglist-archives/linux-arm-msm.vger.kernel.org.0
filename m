Return-Path: <linux-arm-msm+bounces-107971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMkeNcqBB2qQ5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:27:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DD5576C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7089730038F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804523DEFF6;
	Fri, 15 May 2026 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROzmynIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkoxPpzO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86193DEAFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876803; cv=none; b=GdLTNIoNgr2tFtEYziF5wMUj7VY+KFooMsRM8dxpNLg6BKNYNGGS809858IgqmOJCTVSAxVhWV0/pYu3Dg7jGmhDHbEEOFByrzZXytz2p0Zp47ymGhBX22oLdzIza54m8oL+Us6272zmJQEGRBh26M+9HyzdVAqXcwopgqPWbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876803; c=relaxed/simple;
	bh=CqhWlI7Y3gRUpaoWJ+3vbINlHXt6wzCF7GmgQfe9zzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KH4lXHMA8+1xqWyFsqXnO5ZoIG0/+E0Zyr+HU34nHCvLITec1yJErbmlU31bATRX+9z6cb/3vswN3w3pkpefNZy2xRuvdgTxC8nsaW93F9K08yrQFPFKUM466Yj4v8JCpC0QKtgOzrdfwl47ZA9IIDikbfvW8lTs+n2TusTVgq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROzmynIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkoxPpzO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJekJa903914
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=; b=ROzmynIPA6lwPQK+
	xKMW9KCUVMKLPdJ8Z9R/S1iX99nA855cRLSEyp2k2Urql3d4cDxRr7GcEQVe4PIJ
	2HcDgS8c8Xj+Gj0j+SiKNpO3aN21rwAzwBuiuFPMsBRp+JucCvBdZmBf5A2Xs7mm
	0py1fT3+flQLXNZgMlw48QqfWZIYOkUTP/Hh+sWqtk1bEPehlXdG47zH2j7b+v/K
	uBxcFmYcDNgIU5xCU+NFOdFbPEQ6ttSCWrSDcj/YYropdlGjRoxIo+M+PjDRqcpf
	75J+R9jHtD67h3WpEq8DBDnfKt6Tm7Aw/Zik5N4l2DtzC9r4BQDnRd7likqnuDSh
	2wK5Qw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e670u8r3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:26:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso157563b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778876798; x=1779481598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=ZkoxPpzOb+xTrD6QopnHMgcoXVlHgkBVUGIK/bs9tn4IYLDR4DGKg9o2JBLpDA70Tf
         Y3O+dpPEHOsA71EUz0+Ia9cssBMjQC8Tq51w7rNhNw09KqLNXhoNTaLrXUCmj0VIh4Cd
         j5KbXgKSI61cXrhxT6f6ONrqatnvVsrpA8On0CTLPcJMWwFrLoDJRdPMV8qZFFwew8co
         gJeYd9apM4zN2H85LxOXWwOw3DBLGTEeC6JesqaoAMDsJET1NxaagJkKUPxFoNampu5M
         c5ylq0a1mIQzsi2toqXv7NFCdXeNeUNaSzzldNX9AHkuoGpTk40Xt9jC/jbdA+OzOet9
         3MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876798; x=1779481598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=avsCfCO5nxc5JCTsmtIG2Lb5rIp2JwxjUNF7V3J+WZy6v6MdhztJ6UiqYfqkxQnMb+
         5QjYrc5umrEUqD7U9NWteAO3HdCM6Ixz4ACt01P0SbXBRDnBZ7QysNIu8u2nscwfGTnt
         676Jpz4Ih59Ev7OJsrtNp67H2Z6vLk0+6WjPtaKejG/8MN7TgEAftN7IixWEiPY+pIwJ
         6ho/2Dzs4uaK0xHG/GNiuZn/ZOD2L7bnVehuhKri6647sAFyILSaV+8oFS0jDlNF4IcT
         4reZNAkUrPEDpwKpvCtTpjGrvett4sXqLedX7wd/7mDMKnM6BbxpJDesFKdOPqTEtoPR
         zruQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iNW/+5T8nULHqf/bH8hIVLvYSQefm3fwPXaBhOI1gF4YPL3U7oFwe2ZhojgyCrxdZ0fh49P+Bv7ArNq7w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HIgAR6ILjMRaCeiSPi+XVUaDzMEIwQ4JMz3TEHdfIG8L/c/k
	9OEuw//qYkRrjbGl6+D4Y4fIhVvKDE9dDvJyY56bp7SlYtFFv5138jNpYOAPx0JISRNRZ715htT
	ORFXe2ZAgxiO01NJCvN0R9Mg1Sv0YF1uObbf3uswg1oPwNZV24vvdXHcYKbUq7+VDYUAJ
X-Gm-Gg: Acq92OGQk5oopF1WbA4tN2nFLjkLqvT7c04bhFFuiDblIy0xQthedd++CylGcok+brh
	8xqKuthNZWZ2RTBRiTYZi5dIa9CcswUYrNfzpw2N2BBeuNklGJYvir1eTy4pRsvvq9UAUnoIu+i
	GgPqYXM8ALBE43CwRa1+QZLW817FpHGnej2VmmNrcUkVUjACYAIqCCg8GGtOo9Rkq6T1twt3HP8
	lHCfryu5aD9PQTHGmAyH7WJGkNPdS3oHzl1Hl52qwtqakhzD5waVQK4/G3pwXW9qBV3GRvgvyyL
	J55OSrJm5OhRIRVl+gN5TY9nQIfEkB7T8cR93NYpbsuAO/mXHP6oZiMPNjKpTfDtewC1C8f+nYp
	89VCVj40lb1njmTQCOn726cbTWCaUhqWAaMfKGUkVRS0=
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683347b3a.8.1778876797960;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683325b3a.8.1778876797457;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm8255734b3a.2.2026.05.15.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Message-ID: <8ceb09c5-7da2-4cc2-9e6e-0c08b509c212@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:56:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
 <20260515-reindeer-of-original-skill-cb55a1@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-reindeer-of-original-skill-cb55a1@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ceVs8-pWdm_tGaUF2mujeCcWCsCbCQZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwNiBTYWx0ZWRfX/sAvEZ2rShcF
 i74SOw7OWXZf4OM/bazMmxIWsHxPkBLt8AG/WVFEXaBIG57kl2HMSqMzsDblC6hYguvRoz+rDke
 JXrt6oBIN4BW5sGjbxXc+TUYRPBo11YcJcmU7o9RVc/cCkXNbmHaW2DbqAbBPQWkkuE7wwy+9JV
 29HcVd8OzfvDTNlba2iC5k6Hue/SDPx9HCY5N4xc4ruzXzpmE5nOz5/0G3VIhymN1zr1loFYODR
 TTf96qgzqZ4U25BuKymie72r284ZIwv60cgee+AMMI9H1+j7Nl8qnT5/+T9zch7wk1r7sAkh3Pv
 hq9IBL8IgUXI8OsnoutIE9YfKTzglW/wtiH8JHkEUoFeyYP70DFTbCUOcNJzh0umi8vjNRe+9x3
 BCxmpP5rPPGvQAwXXYETajR1TigItNGXWJ4zQO/KeuhbAo4VXrpwNbxqRbr9SdXwVx2EIeLqmx0
 CQPlKc134qAkicHnw1A==
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a07817f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T9Sauys7PDlx7jIQPikA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ceVs8-pWdm_tGaUF2mujeCcWCsCbCQZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150206
X-Rspamd-Queue-Id: 3E6DD5576C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-107971-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/2026 2:11 PM, Krzysztof Kozlowski wrote:
> On Tue, May 12, 2026 at 03:53:15AM +0530, Akhil P Oommen wrote:
>> Extend the sm8750's clock description section to also cover Kaanapali GPU
> 
> There is nothing about sm8750 in the diff. Probably you wanted to
> document the constraint of clock for Kaapanali Adreno SMMU?

Before I rebased this series on top of the glymur gpu dt series, that
entry was describing just sm8750 gpu smmu's clk constraint.

If it is confusing, I can reword it in the next rev.

-Akhil.

> 
>> SMMU since it uses the same single "hlos" vote clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Best regards,
> Krzysztof
> 


