Return-Path: <linux-arm-msm+bounces-114472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nmEXFB7rPGqcuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:47:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE96C3F35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:47:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="BfX/MfuP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cmGsEimM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114472-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114472-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2082C3020878
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA823845A4;
	Thu, 25 Jun 2026 08:47:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2D384245
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:47:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377234; cv=none; b=fHPbrKYWqNTUInRUA4HqckWIKXk29Kos8UjXBl8kj74ODV9QD+e+2YwdMZwCRdEVaWvkBeey2xOSIdnTlP0BxvGf/eIfT++vv0woQ0tZWD7wHCH3MeJz1fjlY216Lox4M8vV/FegmHud4JvYmwsrK1Nbghw4avqPfoI9JjSxD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377234; c=relaxed/simple;
	bh=YfRm1dMc4bpEJ3h6zXF9W+esguXRxP5DncHgBWv5vVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nua5oK8bz5auJmc6bjFNJFukJ65mBKnd5yf0aWsYoIQb9VgzQEoz8VnwhuZxpjVXCTfjFE4C46id7N6ooKCvuShnyA7tj33QfvFWU0/Xtbji6HSWDN8XZcl2dQwtkL4d7r8kURmUHEzLbJjq+pwZuxS4DuzUP1TJP5Dq6yCPtDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfX/MfuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmGsEimM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e0cY577050
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=; b=BfX/MfuPWOPJJyxT
	YOTO6nsCRHX+zeMD6KtqzRyVyGCRUJ4TQKzNQrLPCmnLBHUuht8vCtHHpc4L0rpU
	vf1QKuwZWrxLyzixIewYgd2CP5b3mtrE3qreJKbhQBi07drl0je6K/U4TjL58bNv
	j5lrRbL7sAZIDKO+NGENnCBeMS23PkAjP724b1jyX4imrgP0JaWK/+hmJwO/0NUu
	YyCBgFCWp+BVEdOaWC/6ff+JZIoslZ/GB9xTv3exeirjLWB6ak+/IIz2gpZt64ad
	KPjiBmwcIRkO2lDOkaBCSE4Q7NGEUrilla5eOvUhRIRZ1+6NrdWrx6P11VMnxjRK
	Fs+m7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudh8mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:47:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b9d0162aso37878885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782377231; x=1782982031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=;
        b=cmGsEimMg2zEtJCJGi+AU25XV/SqD5NYI2nc6HQ8TKrdC4BO7rC6XI8DZNht3CVZZZ
         JNVaIgcaf/8li0rCojQBllZq0V06PjoqCopuF0l8tvY8SB7hWxqpnngMkET9ImiJbWOf
         7BnGAl+YJDeGmWGyuoV2tcC71HY2zo6cMGF43/D5gD58NtKjf/yczz6wFoxZ1Xng5E2U
         16SUKP2qXhnxJtPSRofuekkmqFl7Ag3m2JTZhiPS4bvxB3nlzkQc1o8ZVWdbamfgX1uF
         kfSrxG1iGxvr8E0S1pIOUOvPX0uKO1+E1N48XxZ3dqMqiBUUNm5p316iIOMC9DSGm1aE
         kyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377231; x=1782982031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=;
        b=rr5+1mePY8qeqH9luiWEnVfVT3xWUlOu0zxkrHsARWXicMI4zShKzOmPtOoaPWbSt+
         AwPP0mqfG9wNS2xK1aoUz0IA54Lg3EFQGqpqcaiY2IulURWkHrU9Aw6C+nmtd4l41n1X
         5tQDsGUBPX+3S+alcFAfopbYdcvwpqs3Q4ULkhn/pV8EsnJqxCi0fJlfiBhXD8vZ6Cpv
         V+76UsXX4WnMJwVHDbQL+colqeqdz1VM1/8CNG4KMLfenWjrvQnRo0UZ2xqun+Jxiiro
         RNOeNjI3HpvEvHEWvKahp41mZnPPQfx4KzJDhcBMAIhLYMwvZH30XMoE6vOG860aXbqH
         VnZw==
X-Forwarded-Encrypted: i=1; AFNElJ+6QfE9JVNF7fy7YMVJ4wzGygKSSDdpqlchgjMJHIcBMb2wUcda3UzPaL+Z3OjASlyZd6rdqWAhoxRB1Y9o@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtM9jGlcXxH/YrZ4FCleRp61ax2h+3Tcmtzw38/b+SFOx71ni
	sjJ7eum35APv4D0QOjrk5i21sUxMbuMS8HDRAP4Zt7OGE7PvWfvjpYqQAsfOHPU0rxhJV2qoVRY
	dLfmL1GfmQKzs+oAKcsV8kzFFw3Xznb9z8CjBHOzZKkO0CcOC1OJLlEKXW3TLI9afHZ9f
X-Gm-Gg: AfdE7cmwW2giV2btYbBjtvBaLnLcMzrD+9InrwmVfT8jcX2Ax17M2yyi4SRbJT2oZbk
	1xOWU2Ra4+ns3mVNnIl2cXy1UVi7ezGyMzjX2Y4l4P5lSON33FnOvqsYazofNNeXRGQzV2nxZTd
	/N8pXgGOSMo+eQoSJ6gfn7Q8AuZAnVESv64SjYNbwcd+YjwqmHJrV8/6ADJwZiW3E0galurKGVb
	X8JWPeZvcb8sy/Xvp/LuAQ6/k1kE1tviz0oO7VFn5kqCA3GbrS2NeQIgRpGTFeezezofQIyQMu/
	3z8tQ9iTOQ655RE+YMaTVuVLIpW0UyHaUl56V03cxbDOFvOIZuj9ZZ5OTWDSjerEom2JvyEP4p2
	yhnyJOY2iGl1awy7Esf1ad+AqAcN5YLytaeI=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12133321cf.4.1782377230949;
        Thu, 25 Jun 2026 01:47:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12133051cf.4.1782377230257;
        Thu, 25 Jun 2026 01:47:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05f9csm132345966b.31.2026.06.25.01.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:47:09 -0700 (PDT)
Message-ID: <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
 <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX38Uq53XXbVVW
 4x+MwDfsWRkynp0pYYWb+YaEjEbtlN2cZDgU2L7KH6VYebbYxAx+ZDMfrwTTlD2RY4EwudlBbBD
 ezk5Nzb+sLLV8GoyXuMjAV4VkVuNEVE=
X-Proofpoint-ORIG-GUID: sOaScwuR4j5Kn944nmqx5wjTI3Q09-gl
X-Proofpoint-GUID: sOaScwuR4j5Kn944nmqx5wjTI3Q09-gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX4R8sG8Qfy0B7
 6BtxiZ3wAysSuJeII4244yturXOsKuvnc4qMnvow+yN7vLEg8TVtwKoLeGfDb/s4jeysstdBJz9
 1RD4S2dlJNrXZjKS70qVdubarV8qJy3BXQqRouicm19Dx+uehJLy/D9R1X3VaiXfJebekgTu36+
 lcWFDYxK/DWFH99FoTsZ6tffSA7lBOMN4hsfDHBrORZNa6GXlhM8fK7e08eqHbkhHoFkoZl62Nc
 tay0ev2gmRpZyBAs3LBl0yQV9vJuGJuyYkcwqGYLIXOJDMVCJZOZi4izmyuWNr4qhlhMclUbQ3C
 /m0Ck6haxPn0MZ78g3fUa9uxuV5501LPKNmAkcHGit/LIhXIep8Cg8pS5nVn9CBL7m9BBHnua90
 OdB+aJD0TJbvWOgqx+Ht/zmal+qeCjbfYPbKMZ5AGqDLzJkEwMBZ/GkSBukdjOTZMKlqYMu3Sg6
 +MdPKWchJ4oHB+CLBtw==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3ceb10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TtB6gFZ535HFW_zVIisA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114472-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFEE96C3F35

On 6/19/26 12:54 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
>> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>>
>>>>>
>>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>>> vote, causing intermittent register access failures.
>>>>>>>
>>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>>
>>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>>> during probe and runtime resume, and released during runtime
>>>>>>> suspend and on error paths.
>>>>>>>
>>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>>
>>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>>> consistently.
>>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>>
>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>>     2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> @@ -53,6 +53,11 @@
>>>>>>>     #define MSI_IOVA_BASE            0x8000000
>>>>>>>     #define MSI_IOVA_LENGTH            0x100000
>>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>>
>>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>>
>>>>>
>>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>>
>>>> This is true for Qualcomm devices. However, you are adding this to a
>>>> generic code.
>>>>
>>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>>> reliably keep the bus active.
>>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>>> power penalty.
>>>>>
>>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>>
>>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>>
>>>>> LMK, if you feel otherwise.
>>>>
>>>> Shift it to the qcom instance or provide platform-specific values? (My
>>>> preference would be towards the first solution).
>>>>
>>>
>>>
>>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>>
>>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
>>
>> (you used decimal 1000)
>>
> 
> It's my bad, i meant 1000 only
> (I'll check on the icc_bw calculation to get clarity on the values)
> 
>>> can evaluate if this could be moved to a Qualcomm-specific
>>> implementation.
>>
>> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
>> the QC driver
>>
> 
> Just curious, wouldn't this apply for all the arm-smmu users in addition to Qualcomm devices as i mentioned here [1].
> Vendor hook would make it Qualcomm specific.

You're proposing to use a Qualcomm-specific bandwidth value so that
fits

Konrad

> 
> [1]: https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/
> 
> Thanks & regards,
> Bibek
> 
>> Konrad
> 

