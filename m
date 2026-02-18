Return-Path: <linux-arm-msm+bounces-93262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DOZLQqdlWkESwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:05:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D9155CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF3BB3030113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0976A3093A6;
	Wed, 18 Feb 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jkum4PWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYyYnd3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F506308F26
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412708; cv=none; b=EcD99VYZ+jLkSQ0hDsT/7EN4B3mmjXkyomquhVOtDe/18cUKJJ6WqqN8AKugHHiRwfevX7iPUdLqE6u709I7T0ib+48B6+WufR+MLzc7nYZjEJLXYSyl3SpoKWLjRSfMkJT8vbap5Ud8sILwSDkTba4UFj19GKv0PxE7sEy+jy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412708; c=relaxed/simple;
	bh=rxMu4x2D0L9uBLvIPBiCEoVnr3u4nFT74v5nQ+RkYwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XljjugxEDdbiiEP4/0SISlhddf19bK+adl3PhHqCdmSnNtQ6PWmYeocIkZ17vMMCxbGVaMDbuRrriv2CEVKvIQYNUf8LXBMoo+PBfr1GISKv/2hUCh0kL/0t1fvZxsbDiR1FaI/wyzlXmM+UTdk1XViM6Zgy1n+M/Ac4bTjKPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jkum4PWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYyYnd3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8XI1P1942880
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1v4Kscw0kuO/DEc81qahfsz12tKP1JfFz8HRwBsjcg=; b=Jkum4PWp0eNwHwjW
	hLNt23vElzygmGhx/1XQ4GI0jqkIgpCH4a9YzbFg3B7XBWsJ40ZzzvTGb9SQcMPW
	2B/eeCNpoljs0XP76lZMb35Ndn5sxCrWuIf/9y/zuVY7Plz0N5GBKIeM9cd4pwy9
	iIHWQ8iJ8nskjUxnZ+C8XWOgU3L1ZhaHZswlvukpTsRDRFSLDUNSsv2EjZ4sNm7V
	aG8QTKiGx3RgAddi1n4TLkD6bIgUHM2gNdYTpci2/6si+oJk7g0fuXrxDm4VH0e5
	iSxL7Qaw3+H5nzUwsYOUo+jZ1wfue6k9jvNOx7pTJKNpJn7fTN3U2NVqgd230XqB
	WCrKAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3u77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:05:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso394757485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771412706; x=1772017506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1v4Kscw0kuO/DEc81qahfsz12tKP1JfFz8HRwBsjcg=;
        b=XYyYnd3g3oOMoQCbLvuFFhRqIGYf28gFrAeM6nIED6JvLk+q+i+uPQaj7qEcEkAlK1
         sNxX5KzBbhPOKx3ggCJGcDFs0KMzQnfB1g6OmaMTmJ8Mffjl7hdAeDzPv3dA1aRTE6Im
         gc0Cr+XEIIX2XeE3gF9Qn9Ykau17bQNfRbmgfEpRir4XoGqKdKjLHJ7yTKJzfcv0ICiN
         gFweX1Xa6JIPvkviR+p3+cNTEQG2PhSWsuJVRhu9KywqG2V4nrqh0J8O5puqT8CtW7xf
         tkN2an0bQZL5smXdiHb7YOV2kDqFnAIBFakY2tt/AAq14yj/N8m/N0lKF7mxANEcHRls
         sEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412706; x=1772017506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1v4Kscw0kuO/DEc81qahfsz12tKP1JfFz8HRwBsjcg=;
        b=hsKQgz+9vnVGXnOv9SmjEIq8FySQSYl76ra8MqGDXoSd4ET9bAijoa4dn7/qpE8TwL
         7CtWpTkIH7UQmZu+M+iRH9sEcJmFmCGy5bqxUmUFOV8sus+4yZf4Ol4K8k5CyeWGZdAS
         4mYzmo9gGRXafsjel6cfxAO4zzIqCYSqV6q738rJ5103a5lY5W9Y9K6+ShFaZVoiJuzJ
         Itzrx2rLfZOXT6xoVFIQSBfZ2RSdDmToJSj2G/MFAm9fLEbRMBTkMd4noMbRzIBmPfvQ
         Bh4WAPbHcr4aGdANHfVS4iM1iPwgZ8aSQeidt1uUbX/4439FOeTj0YOEo2VWnbuFnFBX
         QQNA==
X-Forwarded-Encrypted: i=1; AJvYcCXHc1Z/emrjKcfcrzH3dV6l/mALWNpWoklDGKVDjsPIxNCZSuZQMzDY13EJKCDwZgwz2aF3oTdDxwDfz2HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTlfje1yHbKKIy9wY9qkuctTQVByr0S3YAAdZAvTzOtEK1D4wJ
	CuQRCgw9U38J83JAumeKhUcdg8UU75B/9M5BPd/GL/yGjOW/uSpU3Gpy1fbkROqmBYtVLCJT9jo
	pLs0kQwmUXj1NIB78ZCx/Nh05/pHVrvJlf0m9S8veW+LIzRhESsWnYsNDrcdunjn1y1vj
X-Gm-Gg: AZuq6aIAVFbSzJZYsO9uBMfWySpJ7GmYkUOYIN7+EnOSKFjwQ8UGCkdUtDhvBNoKMDX
	FfsOXagL/IunFgaCn9Ap9ui+h2rZNvp+z4GpgI3yvEjmcR+vaQ0Z9/lHHenTmKin9CkYHZWnKvd
	b/YLp7hPTocPQ0B0FTeD4Y0eKrooumiXEba2RgQZlgz4OZcMU5vTlTLgmqN5poOQtpBxkC3WYzQ
	74YAxmJ/OChG1E0QFE68s3FBxn/InWwJ5DgBGolcue39d+6IUNf0JFUllErH6zMLdKKN4cwkDqy
	HYpEVGErI263BKheak8DeXkV9xMqKCnUXlqI/PHP/o2fKqP7nHVKY0t84fq40XDY/9+33wE8DBX
	TPYiPD4Lll0Ph/0E3IfIdgVA4ppvJkIF746Vz3eWuhhwVJLw1Qqk5zu5aa+EcrMaor1gqHLcn8/
	veJ6M=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb408c9044mr1661349285a.7.1771412705836;
        Wed, 18 Feb 2026 03:05:05 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb408c9044mr1661345985a.7.1771412705367;
        Wed, 18 Feb 2026 03:05:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm448899366b.30.2026.02.18.03.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:05:04 -0800 (PST)
Message-ID: <36f0a71c-a8b7-4aaa-81c3-1945b268c57f@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:05:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten
 <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-godlike-silent-owl-0a8487@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-godlike-silent-owl-0a8487@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5OCBTYWx0ZWRfXzUrKtGB26i08
 Gc+x2XzY2P0rM10PuE+/aWolHMU6cjfMZLHb4k7IZS/smIgkaWk7DlOrhjg3mch+bcj9MYmQBe3
 iuELE17vhQtVmHtH8AxGMr+DDUpFr+F3DgHGFOEq8B1B46oNNtqtE5TOLZrD2vdHBdfozdviwqm
 k2FmWpp5Jlfhts3NNHKvWYxG4dIz/MWz+bo6GwPCWNwsZDbopZq6wHe5V4E5iTuTwfj4TKUikHY
 A3c5TTt9DwEv6NqG5pNoCSPCO7U5GsNNxTNcDDdb4WNt+tdG3j7jECoQAqTGiZazgF5xdOIDRpe
 HAQyApA9h4oMylLJEFsHa+xqSr++MXAacwCTjgb7NPBdCBBRQczRNmbLz2N2qglyqpRJz11n0Vp
 GhGXsIBX5Xn9JnIJXB8T7Hwyx1vxVIjQ7jKsJkfAIONyXvx762FfQk5IBbJ2qsTyFEfEqycizVL
 Vh7Vz7bPF9/T/syL0Ow==
X-Proofpoint-ORIG-GUID: UFIthxgmzXcrG8N1LD44bfoDlkOTPheE
X-Proofpoint-GUID: UFIthxgmzXcrG8N1LD44bfoDlkOTPheE
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69959ce2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rVRdtUZ5si-n9qu6NxkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93262-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 557D9155CAB
X-Rspamd-Action: no action

On 2/17/26 9:25 PM, Krzysztof Kozlowski wrote:
> On Tue, Feb 17, 2026 at 02:30:31PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The IP Accelerator hardware/firmware owns a sizeable region within the
>> IMEM, named 'modem-tables', containing various packet processing
>> configuration data.
>>
>> It's not actually accessed by the OS, although we have to IOMMU-map it
>> with the IPA device, so that presumably the firmware can act upon it.
>>
>> Allow it as a subnode of IMEM.
> 
> You do not have compatible, so rely on the node name as ABI, which is
> fine in general but... I do not see usage of it in the driver. Why do
> you need to define modem-tables child then?

I don't really *need* the node name to be an ABI. However, the current
binding for IMEM only allows a named "pil-reloc@.." subnode (which is
consumed via of_find_compatible_node() in the remoteproc subsystem) so I
figured the intention was to keep the list of allowed subnodes strictly
moderated

If you'd prefer a blanket pattern declaration with say '^[a-z]@[0-9a-z]+$'
with just a reg requirement inside, I'm fine with that too

Konrad

