Return-Path: <linux-arm-msm+bounces-97945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D6aMKT2t2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:25:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EED299729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99071300C32C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D85220F3E;
	Mon, 16 Mar 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8uOeQax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PylL+186"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A0394464
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663905; cv=none; b=mOtpPbTcwK3gFx0be/qZsJgb7DqNgjfuVq6B7rL/t/h6OFX8G9BLxVUamebLcnOwyRbE6qx4WmoqOnHZGKhf8XFocGG0536IVVSKUJXAulFAY0XCu7swQzqr1ZAt36cYqoNrfejdHpwaAVf7wz7ewTHODEhVmDskRbXHOYWtr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663905; c=relaxed/simple;
	bh=lSpmCKs6zodXDxPnxmd3wmA75ZCOnRCx/fW5bn6fVoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XoblKeXVVf5F0ZqKWNxUlXk3fpPh0GH+P0ao1UpnHZkz8OBtjD4HXgJJWt4TfzVpXuSo1s9kqEHNJ9JX0c5hYNZJBUagpQi3LJUdoIGIk//TjuplWVJCJQodICD7AuU/BANGj3DHtrM1ljw9GjTGzcU7rtJcNPd49nvCxmCu2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8uOeQax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PylL+186; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBkWEa744151
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBNTEclNCL5IXfgD0gIYhKI6BwkPYlaHIemf1BqvQFM=; b=i8uOeQax3pDrC929
	hH+M2GDUKV3PWUsI7ZhqS5SfPdX6ArQ3+yOJvtcftzCbUxFi/KCIvJYu8lK53MAL
	OOBiWbpXPnmBXmCvRu/KbKfgPM8yTth49ZPDaYKyaxw92kS4XUxXdemLhAF9LdXi
	UMw/AeygYpECPcj4T683oIGVaHQY1QD9m6gdra+e85H4cgrEX9KTJGBNwxultpSy
	/toE0dp8ewwmiMdGvL86kb5+G1bWMnynq03EEblbD+wB+3aQcX6r5MFDXcMK3uej
	bbxikGO4+vs5u95iEmiIT1vMijNKg1H7IMVPnTyqfS4qw8XgjJDeoxQw1ZtNSjc7
	pm8sGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdt68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:25:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4f6c45a7so6421246d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773663903; x=1774268703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBNTEclNCL5IXfgD0gIYhKI6BwkPYlaHIemf1BqvQFM=;
        b=PylL+186KCiO7JMPY83/EmJlF4qWDAFp/3/Q/avZc1zMPgy+lm3kV5g1sqgaBqMrqa
         EMQ19aPGO43PFgfLgVz7s4a5sHKoR3M7O0OTDnfKWUjfNUosgWzFHyOedbIiPl3fWSNq
         JUNrMCxnkseMM94cVyLMut3lfAC5lYNVdMHl/xkmUeat4CNftAyuKwfGVP1gFBhxKh3j
         PBSEi/bl7KPDGJPbYAXTNh6xcEiHy1bj7RsE4u0qGy79VyYEzpa6hbVlYE/mJHXZGodE
         cy7wbBYez7cM3gat4KlPgpgI/TvoWzcHeP0iwni/H3OqfRQf/pehtaUV/+qZetXMvGj3
         GGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663903; x=1774268703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBNTEclNCL5IXfgD0gIYhKI6BwkPYlaHIemf1BqvQFM=;
        b=dGjFMub+ou7e7qq57Esiw9QVPvoZhCF0zk66Ix3NCVakuPZDihzZzjyzfEnViJ53b/
         K5IWdOf8mOnVhnyaEb5nHM6ceEsFkn4XWikUDZ+Q+YhV0d+mfGVWpxQH5IQyt06TUtWK
         QFYnCTEMfk1RLA+j/v12MBI48vgxHzi5R4PX4tLF2iDREow46fH/F92Vf9kmqPaOZQDQ
         3trdhalET4z1QO2AOQ6bDfJLAprRrxb6CKXvh6bGl0Q6AoWA+YzbVmF17Nrnt0uSs46i
         uG2Oy5hWGKoSDALP7/KyARNGxpgVCppbnqODkJNmGIoG9WG+Hf6WfdWHZwaWd5/pb+r7
         r3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcpXUaO0UuBn7R1YDyRTRdk8DDFIvvfh0EANXf+/ia/FKmPzn3uFGs3w9QiUei2EfDJSXy5D/JDwwvJZNI@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUEMGqVprE8ZlFziCvvu+8g/yzngRc4xCqc5dt6sLI+aq+Fha
	uLD7NZ1Yd+WkK4tzYymFcPZok86ZoX3pbS7In0yt9KUfh/ZZeMnfi6MV6I8XUEYRHszHK5g06m3
	5KJWFTkci2swHSyUJMuwkgKqZX4hprXSbkZqBEsn9AZ4btd/SofjxSGa6o+JqW4NnzQc2
X-Gm-Gg: ATEYQzwMQs9E5vLLEkhmi9/6hQrboGpRKNjkxuwyvLGGcwGvtXBTops3C3y0KrSs/ui
	4hFsP1uqzZptBlL00Cr+JgkiyfiHKvoiidkwRbfP3pikWcfdOfHZAQXRiVK7EAMkNQsnM3yu+Gr
	SHZVO+wwbvsdS3hWf03lTcB14jgKe4/2Hsp911D37R+W4NrXI0f2k0qqGg71TemxzlMK9uMqFa1
	clvHA0X6cWscgf9qfjQKYD28P59+5QhaO0vvLOAoFtrZBbWTV0dNI7d6GDAAC3m1WaHcnsVCRgz
	BGLjpWzniaBF+3F+Kbhf2kWZLtdUhE8PmaLMEF6yNm/WuZySfv+glviLMajd05pk/2FXXPcJ/Lm
	WvKftnVNUFypD/XvQBTSLLabfy1aKDYqxXV1d+Yhul1PIvD73+29sb+fPNoB8sD1ltcQesuUxxv
	U9y5g=
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr121528286d6.8.1773663903046;
        Mon, 16 Mar 2026 05:25:03 -0700 (PDT)
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr121528016d6.8.1773663902666;
        Mon, 16 Mar 2026 05:25:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97a63bcc74sm299802266b.15.2026.03.16.05.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:25:01 -0700 (PDT)
Message-ID: <46a7e40d-dc74-46b6-89bc-514b3a09f21b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:24:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] interconnect: qcom: qcs615: enable QoS
 configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
 <20260311103548.1823044-3-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311103548.1823044-3-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7f69f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EMGZ7LyCd8X73lh2icUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NCBTYWx0ZWRfXzjBO69vGcuWN
 DnP0qrTviwCfW9yic28da5hZZ9Y8tB1WygQGef5mGO2MIovDqCdutDhIqmihMfxS7qH23Ec7cns
 L4BOa+gEpFq77fTT+nyo1JUmFO9qn/SCm1VoIBZGLk2Zu5UAprTLGOSIuVG7sw5hysowrIIoXo9
 VxAj6SMsnEWyvPu32e18exbmII+B/Ws5DEBfdnSYVXACWHJmmSBXVhCgfoKo6guVsWO9jQE5AdI
 EsbgIskGKKZ/w8kl7Gw2GSH0jF7GWdgOe0+KAXaRLqwHMpok5LjiAHMGLK00sU8k+p6o0l3yH/3
 U0XmKCpK7yCCI2b+DdxC4CtlJ01d4iICpB9LkAQnnHMHjaUYP1N/hGBcmnHq+C2MPim0AwiScFE
 ck5u2gEoH1dyPcVEBT4pOiAEce3K3vQ7k2kH0jw//8bJksItu9wLAR7emcxzCjPMmTkvzYFmNfg
 ni5U3kEnXim4M/W4WRQ==
X-Proofpoint-GUID: Y9S7q8_ZNjzB3SJ08I2rali47hi9etT7
X-Proofpoint-ORIG-GUID: Y9S7q8_ZNjzB3SJ08I2rali47hi9etT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97945-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67EED299729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 11:35 AM, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

