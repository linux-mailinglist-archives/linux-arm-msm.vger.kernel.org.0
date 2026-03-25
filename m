Return-Path: <linux-arm-msm+bounces-99843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEdjMaLFw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:23:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC5323D8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F394304653A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71EE3C9440;
	Wed, 25 Mar 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6OftzwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1wH80k6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584E219A8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437276; cv=none; b=ESlP2/TkRIgkaMr8KmeOGCNAQfhS1d/nQ9KW9BuS6NxmAlnzSaH89PHRJ1lUJXqK2L2s7TRBV0op05azidunO932MKKan9cvC4H7zdUoIWVgP16ePq55vrIqZhBwI0+B3RNI4vlxAWRwNrlBB3qNMaFoM63WAL1iTpKB0+HXcM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437276; c=relaxed/simple;
	bh=5fpy1Ey5w0++MQPErjSRCsxLxGmJjUi5xFpOnU0kLDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gzb50U/MMrJCgO2Y6yK4St5cMIZXdZGBQtt/5a8oat+ih5HYCNCLLJFu3FkzAL9puE7B+qkbpG5rm/Jxv2ZjkJJssiDi3b0Y32HloN+k/lZro0/Ffn58q4jvBTOqn/vhqVBbSz6Nd+ERTIyxD0IUQhy2lGM+gqP+Tp9JxeXHqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6OftzwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1wH80k6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA1pdO920299
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=; b=i6OftzwA2z6mJYoy
	glsDmkHtEFa5qM23Rt5FwswAxw6Srd4Vkp3SlzIG+tJzwXIDlD/3peDH66L0lqSj
	1yRjPmuJMrcXcz9pMYuLRU2GlWGoR1ufvMpbqJPxGETRkM6M11lsXZzYfUOaEots
	NvjrGUu5EdTWxRx1rl0OXVb4NCSHMX+tUv/6WxfxqmPTbGY1qNV7N1xuJxhaA5oo
	dIdE5JCj3RC86ikehHZLBULQzOOnpi8ous2TDc9Yugg46jUX34sfcAFcpZXfGAEB
	x56erHdJMmm2VzP/MEMF6AGydbyuN4nRc8TecHsH74awycgmtCrpIRatJLKk9ZW1
	KsoJlg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhh47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:14:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b89e37e2fso1208811cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437274; x=1775042074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=;
        b=g1wH80k6ReRw0Hyspvh8WC4iCDa27AognIszYN5c/E2LnPXmEvRDWfGkn5/EQG7YKx
         clBXJP+g8WGR5KgfOLseiT1Pgmi3cYnkTQ4SuqGJGTGOb9/yD1mTNjK1E7pmZ3183uiG
         9t9OH6pYDDA+r7Iafi25LuW5StZ3j0CHCK7gbt1uTwZtKtGjirtSLfGsAyAxzmfuVtzW
         M9yKjkYfLcZKmfZzJfsxK7jsSFsUbEPYuSP1tlkpA01/cjsByprm514yPUD9w0LHawAY
         N4oZ6s/mlw7P0yQOH98Z9WFvJjG84RZTzkDad7i9klPRT0hpi9rQdxq1ddLnEoWik1hN
         yMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437274; x=1775042074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXwFeeKmEQ97rmFXl0R9IJuuJY2hAq2hKznQ/v1nx0M=;
        b=jz8js5I/ZfuxJxGc36C9te4OmIMe+P+NjukfLtxPHN6Il5BinH9QW/gPVIf3WdWTNt
         RAdb0FXAqEOQV5sdIuiK5ORM6sKCRIikBuIe8YcNxnmVhipmB0YI1v/JjfzGMwEy9g2a
         eAinvtUHHgxuX0eNuvplz5y7svb7W+5sAia5HtmBiWlRx6VhB84+7nO0NybBgcQdP/ka
         0TiS3QHMIgVlfkfzRt2fJ0XPkangUQjbph13jqvTNl2oxeB+GWL6uCoSxPMSU9sFa+He
         GYwufKzIMLxofxMtZSPNlttKmrxHy+rKKxgnP4RFjudKYaL1G6LUxZE8O8KDd+L2q8Qk
         na8g==
X-Gm-Message-State: AOJu0Yzc1cW/SdnnChlXpWK2CQWv8rU3JIoz92nDukBIsdRTW7xZIVIq
	wVgqLhvqv8G2M8gqNWVQDUZ+ML4huUPmxW+zcc9c4br0bUmR3aCSaR8Q2KlhxD3vxGFt3MR/68w
	3+EHlvys4F9YvXbDZLttVB+4FyLlTQFrBzQEThh2L9NQpBDOyr7z59Fj5nziLKO8BK87s
X-Gm-Gg: ATEYQzwYHLsJmzP6fE+lBDNFOuqIgG2uEaO9mRU88COpwPMJ1kApssLJ3ur8Q1xMpj+
	jk13KBGF7jFK4Mg8GNtF5sH+irC+/kECvjayI1xxuxBcjYNAMDAm0i3waV0tuKV4LUDoZNpEz6N
	6eaP2bGory6vziIgTBIax+OD1kbXMq41P/9yiDvTBKvh6hv6OBzpScXiofcUx8POrX0IkE0f9uM
	DnphzlhTxT7j+ljL6WGsyGbieL9IRc3DaDJRUYEVnWJkr3xNYi4/Awg+AAk0Q0qkhpk4DMXtTqa
	SkpUge1VQD60KTcObyfP/XjKu+3aG4hMUpkj3UmO5JRwVfg3ljgcPYTABDpNflvKno90N10ob7l
	L5CyElzDr/52LXfT+X5yUCnYMeoHgtNpwAgD6geO8y5YAPDxbS5AuB3A/RGJxJYY++6Pt4CoGNx
	g/pKY=
X-Received: by 2002:a05:622a:1e99:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b80f90acemr32048951cf.9.1774437274041;
        Wed, 25 Mar 2026 04:14:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e99:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b80f90acemr32048521cf.9.1774437273543;
        Wed, 25 Mar 2026 04:14:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fd7147sm779648766b.27.2026.03.25.04.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:14:32 -0700 (PDT)
Message-ID: <06ae4215-ba07-4a13-90fe-8696a1683aaf@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:14:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa/purwa: Flatten usb controller
 nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323103119.1801139-1-krishna.kurapati@oss.qualcomm.com>
 <177432155630.28714.18053233967413890890.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <177432155630.28714.18053233967413890890.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX5bN1cvVWR+A6
 eVVPIBT5mtCDx5fURP4NphW71uKj/DFkKFfU29iym+TKnjP22I3cHl+DOQt03+Ku8FKzhUhkQ4B
 Y49P+cMtW7q7/TqW+VWfHsEGtk1fa+50B+OU0z3t9MIZr7FTBeE+wUfH0y4tduTmHX74yd8DiI3
 n/T1mJJA8NVxy5MaMVY1opFisXZb5to70UdLIUe38h3dssGB1zHTQzxVSvJnrL6jeDt5MRJp8Qw
 g5Smk8aQvB/eD4eNNvl/2JAfipGJ+hgp6jHaP8wp7jrtxPZ4jsFaDliEELrlQmzlVnNAIyMl79G
 PexpfQSVmEWpiBPTTvVk26hzSlan52mAWtQoUhI8ZuF1qJ4odRAdoJurdSLQimLeMLvU57NqVJw
 Y3bvPZR5ngZxRSDX254EE/y/MSX+0eMGPkkqKE2Ou6TLrH5QRu3/G5Iz4R+a4fb1C3ACei+la9t
 KsyKg/ndSKkcDauzjfw==
X-Proofpoint-GUID: dPxNFzga5FPp3SQERdRpMKVoZ7B_PYDK
X-Proofpoint-ORIG-GUID: dPxNFzga5FPp3SQERdRpMKVoZ7B_PYDK
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3c39a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1ePFyvKYNLqa6FVGIdIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99843-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 34CC5323D8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 4:05 AM, Bjorn Andersson wrote:
> 
> On Mon, 23 Mar 2026 16:01:19 +0530, Krishna Kurapati wrote:
>> Flatten usb controller nodes and update to using latest bindings and
>> flattened driver approach.
>>
>> Tested this patch on CRD platform. For testing purpose, modified dr_mode
>> property and added usb-role-switch property to the 3 super speed capable
>> DRD controllers and valdiated both host and device mode. Also validated
>> host mode on the multiport controller.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes
>       commit: ab826cc75a90c5524522f5c015b9a18ae8df86a6

This wasn't mentioned as a dependency of this patch, but you really need
the GCC change to pair..

https://lore.kernel.org/all/36bbe3c6-e83d-48be-8a9c-9cbc5b26e064@oss.qualcomm.com/

Konrad

