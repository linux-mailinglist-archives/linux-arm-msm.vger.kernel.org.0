Return-Path: <linux-arm-msm+bounces-109800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHGdGymIFWpXWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:46:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1E5D51BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AE33305DED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BC03E5575;
	Tue, 26 May 2026 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ottv7G/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H42p3UUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE873E3C62
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795534; cv=none; b=Dn9RtCTrym32gQKnqPVhhn04D1LxDp8fTAh54SjeGxSnuCr/+FpKO8P+sWofFnC/N5mA/3RPkMeMDBuYVIrvB9/XIIYAgjS6YBmBmkQvQBSE/AxuVbg6CYgI1+5Auc5LneqKY0VFx2YlnxmaO111Zd19KqGOOkl6ZPKfQFrtrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795534; c=relaxed/simple;
	bh=X75W7d8cnqe8jud+yaQnaegaZgTe5QK8rutBJviYQxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUnSgxTrGMnQeZzf6dE0kbtzw0SdLSAfqtQl3jyW8ZMn+VQpy8dUo+sMr67q3oQqowwKRXdtJ55odgs5gR5iglzL2m5BlsrzOoKeF0+kjbqe3Em36jqow9Hl4aqPYtvr2zcc0W2faGlk6ttkr6IPynoTmYgCiGoj5OPM83W2+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ottv7G/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H42p3UUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q88wfS691686
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=; b=ottv7G/kaQYn5ADV
	+FQYimnhRSKOYIkxzJOVcCAzUycn1xlCnMgNvLj5KiZDfi+KqDyBCne6aNMf1HIx
	LYxoIpoWhsKWMoWvmh2J5Varb+0x2Uj5ncLlEaHn3vs3xXM/Uiib4uUdDgDWERwe
	qIM4WwqlxuGuTA1g+8HYE401aYWpb08/ivr2VXPwTEcgfKJoDO/mS8ffpTTcP81G
	8Nn5zl1p5tJuLwJ1dUYhLxeJ11CIh/LvoAa34tvuCUZyxhW1M9FYCZwsCAwb57QY
	aSDenf09drCCITyvSMlAJFN/1BiU03PFuy/5U772//2e6XkfpIzRai/q5j/55sCN
	IVbxhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2kxkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:38:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so110827255ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795526; x=1780400326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=H42p3UUAq1g/zlwwf/aEHECLf81eZaz7XhF1Cbl2GcVHm1I0Flp5qFanjoyd7p7/qb
         r8l5pszYOMk9WBWNwoB+NOG+vNTvTr7P6fjMNVK3gfzog+bPxX+EnOy0pJHP5x2S3hhM
         rCWe9m8cNZmbbpDu+WjSj8cJ1DSvaqxL7KdkHB3Qd7HpQfipSUOTyEvGpjeEoIQE/ksf
         sQdTJudvgvyMcDWm1g4DYpC6R3W/yAedg8QSQFFNHC/wCEkd4a2kCGjdlpuRYAjuCepc
         SawTLrFVlHOstDNIC6M+qeNtg95V1lJjg7tTVLrOP4ALA+6Aka9rUcVANxeGyKSzBj9L
         Pcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795526; x=1780400326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=pqjT48GeKp7I7xLKwqxL8umRQONGCk2fdzVjBUxQSJiFNcRD/vYs5Oti/1pAj4X17d
         AM2TYMsFL8VqxOnzyghB7Vz78heUm16gsaP3e+dEKJ5Wo6+w7ggWzYEjQB86SYiMdE8x
         sbsZ81R/qcKjLweZPF1j2B6Ub9/VIE+KPomMdPXqKp0o80TkTnEop1ACTd5bsIIRT4nt
         CmhC+J0CmaDW2DJnKkLfCL/wuhJsKs9b6FUHCon6tM/vd2Rtm6R9PaK9iiHy5SJG5XlI
         aw0g90d99J+JwSFO3rFvtsfYVMFgWMK1MQt6tSfANCWf0Fj+j+MPq4RFoQNF7R797HUF
         wePA==
X-Forwarded-Encrypted: i=1; AFNElJ9fv7ifLEG7PxOq2OGYrhkZZZ+T28MrHZLkSMI3e6kxSDV5KIobzcdlOmNINAGRuFPcVUJYBf339mps4pBQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpshas67Pys9PHaQz72vNG5+hXPcMcfXRhhh7cdy1Xb23ylrG2
	mATWHzXMQ/sqFHi43aLrjiRaSqQlCDLcKyO+EdCgE2NBLY68PgUqcDusKC3C1jfc1444APg1iNN
	ZlJ9YRtrGZ89glM9KjgxBP7Dq5yvPJ0UO4c6DhAbOUB6FG5RkcOkt+M++7BhQJHxJ3jfjt54L+2
	tT
X-Gm-Gg: Acq92OHZu13rkSaQhLMPiWJezJenEG84v1RJjGXhvLX+YkC48GwWgpLSXIa/oYtiyBj
	9mlGYQOK3OH8YW61ix3yAuVC3vgc+LwBfMzhKZsH/Cxs+mif+JP/pyGOZOzkK8RycBwKjzMkbtI
	Pj4vnprgvKkXtTc78r5KHiomeUeH8ia0GMp+uxc0Q2UCi3LPbD5eJgn/SRbairJFOvD/vFUMUqO
	VNT1E80KdWVKBiGhuabBDtr0xN+NbLcq0iZS/88dBhNEtdEzse3davEjiK4x66Mm+taxdBHlfGD
	5e+ZmLwjE66Z5Pt/Ri+HybdfoIEoL4t42dO75vMOiFJ/K/XrpgrQ7G00u37BJgo8VbJizlTao3E
	L6FfuZqkTnperzWcjLlnuKqT9uQW9jNJ8e67gX/esS8jh71e2V0X6VckXC7A=
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622507637.17.1779795525604;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622473637.17.1779795525054;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:44 -0700 (PDT)
Message-ID: <bbc27f64-cf24-48f6-a577-5c1cf46d8117@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
 <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2b9sXuwqmmcI7iu0lwbBBz5kpNerfhdw
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a158646 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9AdMxfjQAAAA:20 a=JnjiVvBC-mdIheWOmMIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 2b9sXuwqmmcI7iu0lwbBBz5kpNerfhdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfXzN0JUaSL0W5y
 Ie9jT4gmguccAEUisoyi4spNt0OCksKFtC472JkwO6ZNTM0DNo2jpGCLBaqZs6t7wQ230Kwn/M8
 rOvNQLW+w2z76shxrubN4ZM0/0ubLkZHDnyHnft3wcpJ2YdjZzc+01ftTUy0jEuiAzavvvw8sKB
 Gr7Dlb6EwGgDw/wmeAseU1pK/7eeJme8cI7EcQqVBOU2tNSgqEPQ75/VEGaTLq9bBAwnEkiyJ1Q
 +sWMOPZFIx9hwIl0Pv07qHtuc4vydLnMRmJiBN1q8IgXtiIR7twxx3FL8gHVmvtn2LGKgr5JtV5
 Khl5cDN8GDXJWdPQHOIEaAtcXC3k/uj9IYJUJvaSphZnxvC8FcLNZ1iKl9OI86LMn+pEAH0cCtz
 O/Q5BJ6QjmvMvxdB6DZT/yl8FgJBj+QRz4UglOfwtuiZ8+ch84IYvwhz/HO1mKAlpg55bJvlS8b
 uMf1AkacQWD8h/62PGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109800-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FA1E5D51BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 3:07 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> The video clock controller exposes power domains, so '#power-domain-cells'
>> must be present in the device node. Add it to the required properties list
>> to enforce this in binding validation.
> 
> That's ABI change, so you need to explain impact on existing devices -
> Milos.

Currently there is no ABI breakage and no impact to the existing
devices, since the nodes [1], [2] using this bindings are already
specifying the '#power-domain-cells' property.

[1] videocc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1849
[2] camcc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1918

-- 
Thanks,
Taniya Das


