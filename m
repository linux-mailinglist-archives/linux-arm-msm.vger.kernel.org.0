Return-Path: <linux-arm-msm+bounces-103022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBcjHTa53WnciAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:49:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 287AB3F55AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90B3D3054B86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B9226A0A7;
	Tue, 14 Apr 2026 03:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9tuuCZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ul6wTLN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F0280318
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138336; cv=none; b=Tg9aJvWFeFvMJkJJ1ICkbRFqR16DNzX03AEQm5aybhikOciBhcyTB05Et3674x2RkZZg+1HNomV8p9i0aDOO524fsVI2b33RpVhhVmjD++6VaFAjv5jO+rwXstdYJ+tEnnUSWRQYd+hO8CpxHdEzx7DTmzEWc+sNci49ukQ2lN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138336; c=relaxed/simple;
	bh=hIK9WXy53cxohqH3puQFPkXnuXQEredLGzne+aWonjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgJgdHApwjLDCJ41UX/UfWCA0ggxJGcGGhQ3OOIlEULfVqqzcrFBczS1t7iTLugZDUxKyHfZbWXSesCrwozoapn7bYkPQXYTt1TDLpEeE1gqgGFsikDiXldgwX0pZvifXuxjZP+1xcW1CQ0p8o578RKlSQR2QxKyR8Ia2CyLHWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9tuuCZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ul6wTLN8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCX1C967190
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCWyPq/nh/mg/FTp/TQQn7NdYJDhG2mXN3AJXD3Cfqg=; b=Y9tuuCZymnB80aaX
	Jn7SPnMGp0n/CmWRSDwwoh4voobggBrIY/DtcBcP9UxrENiolFsppvnZBmsRIiKw
	NGFEmDI81zwNX2d01CITxtAvp9Qp3lwQJj/UIHvLarbghMX9ZfcSKZrd8qV+4e5o
	+FJKWQV+UvFOa8OX1hdTWC3h0DtEUJFA4zqwKUOvjeigFuvb5HIAOtDbcO/QnRTx
	3qYiWJn2aIiBihJ4R74ikieaHe+m/p8MY/PdKhGTsECqkVUUSB65poaJucmTk7A3
	VDcn8ZcL835lGG0HBv4MoQeTFKSYCkabVsjdXfFfhzT+I1zt+4TSnkgpIxnDav7b
	Ea9C6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v0v9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:45:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so72153265ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776138331; x=1776743131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCWyPq/nh/mg/FTp/TQQn7NdYJDhG2mXN3AJXD3Cfqg=;
        b=Ul6wTLN8+WIWC49wUwtLS83wCp/qnN5HozXLjrlCAhkNWshPBJHnRULubOFUcnHqCw
         gPB6J0bCfeV1y4hpmKlMibw4foxBlLhvRrloG1/EZbRQuF6rVsmbfyr6OKDo/GPrtTFw
         N/R/qjA5t6FKEPgrw+Fle9UUWtBgT1smIGNpvVX6jOqejeo52TnpCF/KKiLS4ZAar2S5
         j3DpDHyOynAHprZdpTccE4Erxc1p0sFQyk+sYRZYShpzwH4BVmSH48cYH3P/P0x3aRtQ
         BBDVbWb47F/jtqEzOxTfI0KHVwOAEi9xqVp8Q7PCmubltI9rgtSeKL9+snQYntW5y7Wc
         VHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138331; x=1776743131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCWyPq/nh/mg/FTp/TQQn7NdYJDhG2mXN3AJXD3Cfqg=;
        b=ZCSqbtUOwCQ9AxopvtAOuJHqRjDDr04Wyv/ghjQlZcZGHqufetvwtgSYOxA1v+t4ev
         0KzyMEGL4r+p0uFdnMtDI6uPAntQBUzil8tO+qXQFLS64HLqZB1IzMbPxqXxP8Is7up9
         XrnipCwck+LBMZH+klD35PisGxVKMahPYSE5as4/XaDWmPtWpg5Kh2iWdmmAbhvwzrkD
         uBGh6LF+dInV65VweFqqYO3cU80UML+1+s6IaQIV1uXEMhM8ZhIqKatAk0deq1Vfs5bu
         qYwEWZscFmACwBFGuspuzdLHWSBpkJgCvEejUL82AAM1rl7yegFmnLy2ei4JRuF7nkMU
         6vKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ar+z1PU2AE0aEwZldpOSyfsvjc/0qX1jI66LupqRWxW94AGN6wFz8frj0tundIg+wFBasGk3kOdcqLamZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMvaHjkQ+E9i+fT82v6yfeCqW6oQG8KNjLVkYIO+8DiCXWJL0
	I9NGCQQ97BK67mE9oVr01XpgnDKvWQIjN1W4gJHTSQHfihkakZbKjcMMiFXNbdRoGYBvrFqv5cE
	+vqrBCqPIGquyySyUggUFtoFd08X7NmGhbCz8OOK2rhXYsq/kOmBw2M/t29ue/BLM42Rz
X-Gm-Gg: AeBDieti5vFTI6h/mBOCApvlDtUGkmGRlwQSo0wVSdLtodRPOx9FD+GibFKJBDAKiyv
	M+zrsxSsaTBXhC241TCyaD3LXiFbpc3A0dPqSL/oTWxipqdKy6NgKc/bEWVq7w1C83EwGU28+9Q
	QJdO8z/+PC3Ww6COs0fz6YEnRHXTTtLmZucPLF/QCyO8qABNPwyiQaeCsA6WbO+qdvpritz13kO
	EcA2AxzJfo+kqIzoZWrP11jLQYICyzq8LC6Oaew7IYsqRzJLL4S+9lsaX7LJlzCbkZamdxm6kt0
	d5aWWEU8mhn2iwj7tr8bQ/67pbC8Tmte6i12GydyFV4IspXqiEN1nobJPbfcHCY8rsAtOSLLlig
	X/2o+AH31bKgMdPbBYzepbTO9bHhMUKMm7cfe2YIst9cRuvLTPw==
X-Received: by 2002:a17:902:da89:b0:2b4:6608:41dd with SMTP id d9443c01a7336-2b4660843e5mr35521845ad.17.1776138331123;
        Mon, 13 Apr 2026 20:45:31 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b4:6608:41dd with SMTP id d9443c01a7336-2b4660843e5mr35521635ad.17.1776138330685;
        Mon, 13 Apr 2026 20:45:30 -0700 (PDT)
Received: from [10.217.217.166] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2ec258067sm71622195ad.9.2026.04.13.20.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:45:30 -0700 (PDT)
Message-ID: <28928e3a-51b3-45d8-ad8a-a778e9f4fa33@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 09:15:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap: update email address for Taniya Das
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <20260413-mailmap_update-v1-1-5758fd5b0647@oss.qualcomm.com>
 <14ecf740-2db7-40bf-b647-1e2d7a3ce95d@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <14ecf740-2db7-40bf-b647-1e2d7a3ce95d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMiBTYWx0ZWRfX54o5y9zf4GoN
 la3ESE14mnLP5WAMzEN3qfiudin59z2+v0yCcnfYaAJzFdBrg1VLMcofr9m8f3mXvN8TbGH6UCi
 QmgkZ7/2cxQL8M58OeArzDKU9E1ZnJvzMaCpS9Gt+dK80i5oMRlYD6Hc1MtDI/Fc/UTC+mGdHQe
 /ihQbYMfzlnZvddHPzqbFca8PVrpQzToLqf20Ane2qjcuvbBVfm8hByfkiGKjpnlvDbV4BcD6UC
 2utERB8DC+6BvtM4ujkPQK3VLw88hctSZc0lP4CxIyAKTRcFZF32OQTBzFgrTnSqGzRdo5J5oiH
 KVz5gjj/UPhKvLGuNeEgD/fVr4BQvjUxZGOhzLdcZkqQ4rBqo92ZXlKaPkH4jwrNQMoGAPQPhc3
 Xqo+TMtuLU1apFhEBNmczOzMYMVkoDkeV4IkgVhkuc/6sjXZMVTA3OF8ImKUtzIt0fEjXVYcMWT
 Dj7Ga+pHbmN+ikXiDYA==
X-Proofpoint-ORIG-GUID: SB7RThkL8p1ZQLb5_u3dUkGhgcX2acne
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddb85c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=7YfXLusrAAAA:8 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=PSgcYXQzAAAA:8
 a=QyXUC8HyAAAA:8 a=z-GyDIX_PptfG66v4BEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=SLz71HocmBbuEhFRYD3r:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=wWUH5_S2rmbbYoQN9rHo:22
X-Proofpoint-GUID: SB7RThkL8p1ZQLb5_u3dUkGhgcX2acne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140032
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103022-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 287AB3F55AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/13/2026 2:05 PM, Konrad Dybcio wrote:
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -830,7 +830,7 @@ Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
>>  Takashi YOSHII <takashi.yoshii.zj@renesas.com>
>>  Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
>>  Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
>> -Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
>> +Taniya Das <taniya.das@oss.qualcomm.com> <quic_tdas@quicinc.com> <tdas@codeaurora.org>
> I believe you need to add one per line, e.g.:
>

Thanks Konrad, will update and send again.

> Ben Widawsky <bwidawsk@kernel.org> <ben@bwidawsk.net>
> Ben Widawsky <bwidawsk@kernel.org> <ben.widawsky@intel.com>
> Ben Widawsky <bwidawsk@kernel.org> <benjamin.widawsky@intel.com>



-- 
Thanks,
Taniya Das


