Return-Path: <linux-arm-msm+bounces-102353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBmxKIWR1mmiGQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:33:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7993BFA25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0958D30EC0CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 17:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E5F3D7D8C;
	Wed,  8 Apr 2026 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J50gLstg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edoI2wgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64D3D75D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669234; cv=none; b=jHo7y8mh3IYdUW6F7b4UsNYq8M8+j9UG91/GIKMq6hjphLZaJKriUFfEftOnp5s0hf4I3uovzxmMWprAKGdcMmYKMYmrWEybUXWkiNjOfVJ37FerKsm7WeplzRS2JDp6nTc3lGvFzkqsyfKbg/1w394Neghvl+NYckncR5WkdMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669234; c=relaxed/simple;
	bh=YYbZBe0rumsW2vmNVvL6jqeAqaup3akyXA1RKKo5dcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLhFWthi4xoTDHlqIeohIwULquMCukood62aOlOZzVfvABGTyN8smkILY3whjzk27psQPTHru1V3+vH47uwjsztSD+et4I35eTr9AlcoXZkJyevtfzHNPOzLJayY3c0VBWpA116n2uuD/hhlP/r3IJPz3ZKth6eNE5sB/wUqVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J50gLstg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edoI2wgt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638G3Gs83781304
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 17:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=; b=J50gLstgP0fA/ciJ
	ewIGPNAE8wZOH1nGkgIZ4B9IGehpZoH4YqJO5/U/XeiPzqcWbER29r+PdzpciDLR
	S9ucj11HgcuRduSbzAvDP6MZQHFsu1LARrkcH2hG1CFqeF69SVYAuBdiGRrH66w7
	ogpojaBeYo8B9QLnjV5hva9EfpHNoCmrQVUyp2OUPsfy3jAuUIZWKqCGHPiCaoWb
	NX4CLvlvxY49StRSydOeZp7ANA6dlnrCJu6xp52Y/ki6BlZEf6YtxhuMzH9cYkXW
	KdpgFEIS8NcgAVGtOPR/WqGW5lo6fwpiBfW8gufQWemyZfmyXRgxpCOOAkk4hwi4
	Cb/2IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6y8amc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 17:27:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7422397574so203775a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775669230; x=1776274030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=edoI2wgtZfRQDW4PKanIq20lhY2lfrSXRhtZE/BK5UathWtqI8gmhXxNZd/15rPj7H
         1eeu3J4EM59rOmXhCLLs1bzFcNv59ROZstzjYL9kQ9q3BacWPINwOmLViGY0VctWEBVT
         xcU3aRHE0eAqYL+iH9fn2kKI78HTLWuK0QbyCMCfu6jrJ10yRlzHrv7joc4S7M1SI+5G
         +jYLU0VunXOpDBYRZIqq5puY4pE07MlnF334dqFhM3yGamEa/82XQrTiirGkVYP21M+y
         Ig2LC38bDEo2RWOUAB8IsblHpCQqTv7ivthrDyctSrjN4TgO3e+s4ixlPXS3de/uIbzX
         jpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669230; x=1776274030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRHdJEFAz4Y2PwD53tIsM2jKn4k+iGIR20zLlJkpvAw=;
        b=gfHV4lXRO65HTH1vmu+erP1XB7DMNSENtXtEzsKqJO2b9mjdWcYuoxF9zz81dvgiKp
         Bh4zppm9dtf/w6FtTRSRMhBbHKx8bn+ZtqGVQ9llAIHXVNYp/0y1YALYdK18H9XelJSD
         CxnLJTcqnxzUzBCZGU82MbM9Ruu9yxBnDiP6e1AL12ZXdoWr8Mu64qyOUFX/VmMzrLET
         Vdl8oO6FnkOHlg/kPy34us8gH7rWyIqIIkRobCLeFzfN3EQg80J20OqnYh/njjLP/6fN
         9bgZXD6FGyY9ZGx+p8kv4qYy7tFj2ij9737HW3M4U+xOGDq5zeIjyfTFtPZ2SIOr3ijw
         d6/A==
X-Forwarded-Encrypted: i=1; AJvYcCXxomLC3X4Ush9fzBPu0WLW55XGlgQZzhXR6YXRrQUF90YTpl3MJMUwkSdXIn7GGZYIZu7Z0UOlGXAe2Ie5@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjRQ6PVTuW4HUNKYLKDEjjOCoEl/zmaksl4Ga+FqJrUirEiSz
	0f2/2/lGaQUvMz4I5DSlOvP0ISG0bIZMP+ptHTAWWLv2T45EdXpJzUNqeHNMM5JiTrcXEMC8I4L
	mESZbe8d5L88fDZ1CD4FbIUvgBB7N9z4GCTdk/7FZw9JBrNOntlVSsQ1OhedHM9R0WvFA4zuirk
	P5
X-Gm-Gg: AeBDiev7GCySkZjdiz828VLPOYUJZJEnFnpaUwuA9jFx00OdQbfyOcoe5UijAPEPPVu
	4ONotwNJYIJUtPyfIzRLl3AcoIylBJwLQJWCGRToA2G0aqYikyQFFF6wpFD5mmPEUmOjeLlaKzl
	p2SjbUjdTFlNSgG6NVLk0BzvA8ZWQyh/QDQFpK8QoWXn4MdtSxC0aI5OLNxWTMtu38SrleZTkUs
	pC7QZUGdDPLxtkD2IMa8ibpESqrPHiSeOCjwAv9q4wkFJKH15640tROmDEg01jtPw9whDzSuAWQ
	9A2Qn/amugaWPd90cif1CXzx4AWQ2+vtBBnSxkNxPqh7fPWLzvCedA3BPAgYGzCzLbSkAIW/QPg
	7HnDJtnsEhwtN8jyTpXx442kdgQBmhgkNRqxFiBgtaRoTXe7xK6EwjTxbRmS/WyoUjXKxpz5KxZ
	jJBtGZjg==
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155910c88.24.1775669229612;
        Wed, 08 Apr 2026 10:27:09 -0700 (PDT)
X-Received: by 2002:a05:7022:ea28:b0:128:d4db:4478 with SMTP id a92af1059eb24-12c28c2437emr155884c88.24.1775669228903;
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d3a941b6bdsm1705140eec.24.2026.04.08.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 10:27:08 -0700 (PDT)
Message-ID: <d822487c-519a-4028-bfb8-47a778d26b8a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:27:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8y0MuYKdkvVDNVM6QlmBf0GIvZFjIjPU
X-Proofpoint-GUID: 8y0MuYKdkvVDNVM6QlmBf0GIvZFjIjPU
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d68fee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=K_8wqBj_W9ihw6XZuEMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MiBTYWx0ZWRfX+1DD5RQKl3Sf
 76nuaqBBHsdM5urRib1PyeJcy6Ed3qsiNgpsa3Dkyz7ESuxo1b1/YRcaF0CEaZcAxZM2zYQlSJL
 gqefIRKaGBfoymnMGwPN2KQiX8YyMJEpL9p7R1qjy7rkYe0AIdmE4uD+XgC+XVemh43ybcE8vcW
 99uTm+n32dMiyyCx+Ag4cs6TLNKr4w4fess1Od7bLDT7m6uRrXNEKd6XX4CvnmK2OqpaO7l5iGG
 rxiXKgyFVbvGidEp2YpBLVx8IX10cBGBQNQuQK1YswSu1hLCJm/XGpjJMJr3gcvV1PrWpuoQi6u
 4KceBcZlChAHNWsfCUlW+980mic6jJn03C6/mZvU3R+KAgxSHFxLuDnXMr8YxeneUOJdf2U4bvT
 TJoCXoSA5zRzrvmrtRnj85Z9++mAkc4u/+a2QEz14ONLXj7sgoc7l9NoS/fFcshEqcMoSiKAwqe
 qzThzHpRHWXuk+GYZNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102353-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F7993BFA25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 10:15 AM, Jeff Johnson wrote:
> 
> On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
>> This quirk is used so far used on:
>>  - LG G7 ThinQ
>>  - Xiaomi Poco F1
>>
>> I'm resending it after ~ 4 years since initial send due to Snapdragon
>> 845 being one of best supported platform for mobile phones running
>> Linux, so it would be shame to not have shiny support.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
>       commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
> [2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
>       (no commit info)
> [3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
>       (no commit info)
> 
> Best regards,

Sigh, I did NOT take v4 of this series.
I did take the 1-2/3 subset of v5.

Note the self: actually look at the output from 'b4 ty --dry-run' before
removing the --dry-run

/jeff




