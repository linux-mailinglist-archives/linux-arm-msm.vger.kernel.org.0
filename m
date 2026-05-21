Return-Path: <linux-arm-msm+bounces-108994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fyvnEYrRDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:34:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B100E5A26BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD37A3123E19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA19E37702E;
	Thu, 21 May 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4rGFuJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfwAsDHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80808379982
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355560; cv=none; b=Wpgt9rRktZ8NOXkYvM5mGG6ESnulwxPs7qBfQagduDPT5GI5S3qGp2ayAbCUGUNllznb+lh/liRAAXNBPso/Yeoam3RB7UPZPQNq+ClTjiVogTkVBrPuSMbBtYTznUFFwrIb25OOb/f8kCtkWqxwuBNRKI5/5AEUz1vjTYK4F+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355560; c=relaxed/simple;
	bh=Nqr0JkyvOkWgV0sS6fsZzWc6BzCw19rKxhEgw4XggE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn66qADrn7ZxtoPcub0cROfRaErWVQIxSxkDLoYP1j59mtOhPO46pc1Uj9bwTPdgFdZ5ZaRXlpnuWuvcIpxQ0RMbt9rdMuSZcUqmGG0b8/6QPvkCBK5H4TaE7VGoILNA9ArzQ4y+LTOcspStNj/NJ11npoytLFrb4OfUNXcU+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4rGFuJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfwAsDHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uVk3772801
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=; b=O4rGFuJJa/RUy66+
	B37Scskag1m2+a99JU1Cfhs6rVEBL6k/iQwqN1Ph05mJWLyAnlLmfaRfLiKMX49a
	cNRf/tMyanfsxoxWSEAv7H9RCptbGxxtTukul6QFbPnEr8e/cH/jsDQ6KGEW1CY8
	S5Q+aV2Pn31w700TuUYbKfetyB3PDoH81x0hYmyDgwSB3fwLfQ0EcB3qSiNTg2rz
	fdzYediEtpypCSs6NchwZhrDNOjy0dFqn6YdMak75qIUf/TQbskoSQJ0Oth5bQAx
	LL75E/ocmQXtueIn1fjwgAX0WnNHTEcGIOMEgL8c76QRS/DEx6W5pDk2lD/EyfYY
	bgDdsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42fq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:25:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90f6e66879eso145545085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779355558; x=1779960358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=;
        b=AfwAsDHF6/IdhYoKWTavG5y4jj71K/pMGJAXU/efiHySGoGDTB58uW5wPtXQRVHaP9
         PV8JeonG3mF8fnCnZo+VPoNH0vQcCatNAUixHLixfwOtLwLFnrFxnXjXf0aRobUqZrVk
         ZiBpjZp/+55WpXuwIPL4y3MObFAKISEPiTyiYzOx9RrGQAvaN4bPXmfJzav/fHO1yLNg
         ZL2UdWHmA/c2muA3TUPk916y9cSJ3gAJHhCHDpukoUrs3n2oV5HHRxohn+qQrF9vWEIA
         +wQSNKge5/4UaSOfasjm/9RS3nmaL4FIz0yowIqvPetCDNkOvxnG1c69WAoya75mqVT1
         jSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355558; x=1779960358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVNml/ucS7PAjION1Kkzv3EoaYbS6bYt8OV/SwpvUBk=;
        b=BDEskB6eU55lpJcMejEtCQ9sbWr/WX+1r46JDvzFY6RMCtyES+khJGb6AeDSGNi2C0
         d1qHB/gkR7iOMU4EfVqPchoXG1fortsIJt/1iQFH/NR0OSSny0PuhHK+4dfiYfISvWTS
         On8NI+6rLwO974gBdkSLRVDbsrsU93rVWOxS1v51MLy8S3QAWjfvmtiO7EnoEQQhkpOz
         NEMp3UYNAitM7UbCXQ01Dk984i2x9ZBJyJNneOl/I/zvIdu6zbXjsIATz7P7ASnLLmLM
         UVkvZ/qZumvOPDhhVWwLTPHD0QsJTzUC7ayzr7J3vazvXTslU8j4WvYTD/R2pxeDDe4A
         rcjw==
X-Forwarded-Encrypted: i=1; AFNElJ9OHYbMQF4dhYAbgUqRS+8dHwvgjr2tk+JN7SgNnxlI3vNfXjrusVkdIfr1m2vK9GR15Oa02rKcyngYpDkJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CLygXmaMqhggvof7vd0B/bXPeSzi0DDBgWJI2TEZKKlS03kw
	2XfW2XkGjZVnELXuD1OIBdn+zvaKatNhBfQBEBRV/82AkSENH/ttQYAC8o23qTnd239QuT36+Kg
	bGmofrSm7HS30TfehLZZg1lb5WidgqdElUCoiH/7Kp5eATiR5my9/LY6IkYJLhyxMo722
X-Gm-Gg: Acq92OEKnw1RU1P0CRNGUMfKh53pONnQbxSf3PRNgkmABBEDSPe/J5UxSwWzB+GBL7s
	q8NLkE2vNact+Mx3NlD1RSKMjXN06A0GAoErCtsTM7kDbFyvrAvTkc+NdU57+WEv4llzrLFCx3g
	bU2jCCGvvY+N2B47QstqEQRRxISQmgEAL0zXgwGxUzzivrKcn6suePCH93hTA2ChiNABcWR6Eur
	Bz3Z6ZzWWUJKnJJFBmaROFSFxy9f4K8FvweVp/rhU9V1PYe6e4GzhaJEbgWcoEYxA56E/TsggHK
	+8lNpapTJI3aFRNWzypuO6Z6JUNlJFR4C5h28hDcZax9pHF3W+/USvlPF1Atl/oNm41k4f6LxYh
	lpKsXH75/exa4LyCkU5PIdbreEH9Srwjt7VxshJQ53XvPNiCwScepoakdC1XjM10NlnSBfHDDLE
	+LUjQ=
X-Received: by 2002:a05:620a:bce:b0:912:38a1:1273 with SMTP id af79cd13be357-914a29e3d84mr176220785a.1.1779355557694;
        Thu, 21 May 2026 02:25:57 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:912:38a1:1273 with SMTP id af79cd13be357-914a29e3d84mr176218585a.1.1779355557257;
        Thu, 21 May 2026 02:25:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e6d1sm8694015a12.5.2026.05.21.02.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:25:56 -0700 (PDT)
Message-ID: <1c570243-45b2-4813-b070-9b22dfa787eb@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:25:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xilin Wu <sophon@radxa.com>
References: <20250110092326.167575-1-mitltlatltl@gmail.com>
 <e94318be-1584-4e4d-8f92-99df8a284dfe@oldschoolsolutions.biz>
 <CAH2e8h6skog5P6hPc_DkVpJzR1Wj3s7j8jx3vMcRyCn0+sYqCA@mail.gmail.com>
 <ec4d11b5-7a82-4e7f-bab6-290d1055f1d8@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ec4d11b5-7a82-4e7f-bab6-290d1055f1d8@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ecfa6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6WkqVPdYesW7Ksm6RcgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hNJRQcudtk8H8rjMjPXNLPSbrKF-fc-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5MiBTYWx0ZWRfXzv3OQBNcPCen
 NBjXm/0X8/jCk6HKhFA3tsCL/S13xedjyM9+ejEzx7zscZB6QzyKhrIPfbUh/vYBPc0/wTVeNYy
 s7BzUXUS/Ajv5uFEz0yRYOk7LIqsMI6zeH9KvjiLwx4SFMut32aFnTkM50Nr96yxYgqSRFfgW8q
 BZzvWCyJqxC0sEF5Xy0kvsFoVnT7O7IfqzpcUrO07DBhJLIZtWw5TWvicCy5J51EM+/+qRMFt3+
 69S02Pil8P1qGsIBxd/EuoGgouvZKKjK+1r/+HukUoKdzVQDx9NjAaog2MT0eOf0cAHm65ZjjRf
 46F5SiJ0WGwin66fmRhB4sQUxroFuP0nhKgo7FT+CgvcCOtaNRMeBnzjPEgNDBBzZXLZ7Tcemot
 0bAsx4F8WxuAPucNtzHcHoKwRt0cxoKaQMxiUuHgm+fJ9tNxSp64tGRqjKPJGYe90Tb3dwM29xE
 SIjzD8ux/KH7H68jDKg==
X-Proofpoint-ORIG-GUID: hNJRQcudtk8H8rjMjPXNLPSbrKF-fc-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oldschoolsolutions.biz,gmail.com];
	TAGGED_FROM(0.00)[bounces-108994-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,a600000:email,a800000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B100E5A26BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 9:45 AM, Jens Glathe wrote:
> On 18.05.26 14:08, Pengyu Luo wrote:
>> I think they might take the power sequence into account when they were
>> introducing the devices, vdda-phy(~0.9v) first and vdda-pll(1.2v)
>> later in the upstream while vdd(0.912v) first and core(1.2v) later in
>> the downstream. BTW, the DSDT is unreliable. On my platform, it
>> describes that several components are consuming several LDOs, but
>> these components work well with these LDOs manually disabled via rpmh.
>>
>> Best wishes,
>> Pengyu
>>
> Hmm looks like schematics would trump these speculations. Maybe wait until this can be confirmed.

My previous reply was wrong.

via CRD8280X schematics:

                USB0    USB1    USB2    USB3    USB4    USB5
HSPHY   0p9     L9D     L4B     L1B     L8D     [L10D   L10D]
HSPHY   1p8     L1C     L1C     [L1C    L1C]    [L8C    L8C]
HSPHY   3p1     L7D     L13C    [L7D    L7D]    [L2D    L2D]

SSPHY   0p9     L9D     L4B     L1B     L8D     N/A     N/A
SSPHY   1p2     L4D     L3B     L4D     L4D     N/A     N/A

USB0 - usb@a600000
USB1 - usb@a800000
USB2/3 - usb@a400000 ports 0/1
USB4/5 - usb@a400000 ports 2/3

Regulators in square brackets share a single input pin on the SoC

Konrad

