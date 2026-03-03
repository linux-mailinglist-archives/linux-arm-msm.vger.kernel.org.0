Return-Path: <linux-arm-msm+bounces-95195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C1wJr0tp2mbfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:51:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477B1F57DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1331301452A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85C3381AE1;
	Tue,  3 Mar 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4lVI/sN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iE4JIt4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4D4DC549
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563836; cv=none; b=J+V5SB5jjgNApK7YuNefreeDQLMgmY/Lpsce86puojkGhX9S5qg/JRaCFg6AzVtQQrvtKqJL5ISL3W/EjcDDZlI6ZuoF0PIscPoucQQfE/NZras5vVnMun9L1FMhqzaixPVeTXux7/wWhS11sl5rnvbutbFx2h/MUcyzbez2CZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563836; c=relaxed/simple;
	bh=BhzdJyekgz0SUdQuPdU2KmCe50jZgn4HDDf2/xppf6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=apV7/QeDfCu/OEmwU/Vv0w1pq69wZsEorG2vt4icHl2mF519IsfLlrMAox4bxmjGnV8NS1HfEGoaVTrzN/LlGejhk/8Hs9qRXzpQQX6gA3+ov929iVNkgJT/jtcgQNlhffbsJqxKZO6AAV7j4cfL398CEvezTFyxDXc5bHC+n7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4lVI/sN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iE4JIt4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0OBw1265339
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=; b=I4lVI/sNO29U8EMf
	6T5bSMKzok+c0ixTGjwSAdTDDHPUhM0ANx7n6CzqqvZ0v+TWbxN4UyYnfnRPQbxr
	NDNjUFcySTA80kgjdjCxS6PAjiKpcHJPMct1ISSiR68RbPi675LSNu8PtwtBxoj/
	tesbhmyn+MVG3Cq0lQh9R/OdGr6nqNKI4/N7RtOCh3m3fVCr65H/T75D0IIV5AMj
	vcPPPTlkGXa66j0xiWsDhkzWEIvk/Xlj+Krl8bdIzqzGzL7gvHOJBf9Mrc5mCJrB
	/+Sm18nxc8AmINZFf3xgzuTx95JX6W5cEIHaTCcwSmSQkSMrOlWe1KZD4BHmR2S1
	Uk5Ycg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9gpxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:50:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so29739085ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772563831; x=1773168631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=;
        b=iE4JIt4IDYSVb5jo9Z8c84tkSn2fesXHOnhHJUB4jUfudfMvUMWtnFYAbLyzc2DsKx
         +D3isqakTDqPhprRZhqqjTpuHWqgJ3WBlQtb9ZE0Ek5Blsrd+YsM/T7rVK8KFsbND+eQ
         OMm3BLuiehomRRP2RkQEuyvK0qpGnlZ1xa0cYgo+it0qrh7VBgf2rj9f02B+hyRjDcrS
         G9LdB6NRIbJSr96xuqzhOp58ozCwq9dP9c6RcvvAd+TcA+wI3ObQ+MzZpEU5Q9zaq+cu
         YBY/eT1PKwBpC67XlZUfrD2EvyPMA05bImvuxK/pBft7x2DE53gDWkbbdbPntI0uni0I
         x/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563831; x=1773168631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buvZSBdZ9Dfv2lUvs2TTRnj/m5Lm8hd3/JQq4D8/ppg=;
        b=Hf0mTu5eJpfrLKihlIXqsG2bDqCgLXuXhlQK2FsqEe3rU4dIepvHgtEdWqwm07gMzb
         V7u+Z9WSVcc2056QbCC5wis/fVywa3qdhcrk9BtfRPT9fEGKgNkiU+eqA/rbsT+5Wjvy
         8qUz0ntqmsSnYDOsac/Zcw4yHOZfja4RR6ydAzsWvM44OxRnWPjY/TP9piaf3Bzqp8gF
         aIZYty6MghXD0DrUEKYsmO3JFL3OnyDUdjriiD7NOeCMFLbTz4JyarHYhAJnEVrAaYYY
         mcA4vaATXyO9WvbuIqRMXpoNu+cfDDS3nLdCFMC1P3e+cpYj7M4pvo+ahcFWJvZmEhzr
         2qng==
X-Forwarded-Encrypted: i=1; AJvYcCWG8FiMnC81ny9vjLYivHYF25Rm/Uo1MzpeLEfnKkfm50Cr4XyEbvoh2fhIFvp+z6NZts3Vlt0rca/bqJYz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx887oruL8NfVSu0RZU3ej0CKRnAo9hXw9Agi+Aeqn9MHvIFPHA
	cXNgPigt+kioTGQ23oxzOZAaNg5/l9KCSIE+bTx4XfANzVg2+UeHCcHX7H6vfUPu9gdl4AzXE4S
	ZBKiCPaCpvxdst7VH7o8v80mW9SPuSIvVLPZIKGmkbhJO6I3xSp+bOD7gL7vBJXDeDWGI
X-Gm-Gg: ATEYQzzOeW3id+kwom8sZQkDjIL5B0x320slw7NbGqm1cCybHGEJQLIFEqW1ogQdyOr
	Dt3giRCubfIkcfsn5cVPKiN/eUG0RIDsZp7he9KMy0xILeVwG3jwE8xYhwszcu4vmSuA8kOCnyt
	lVMQ0UowxFN/+MUn8Wz/5iynrbzf163bY+BXfnpr8tjaJ29O5p9gsiyv/kmk/IakOor8GGb1C5H
	nWMDsG+Io7lgBa4VN1UlIaKRHWXdEh7QqkapnHn/leBSxP599zeKvDY+5b1Fz4PXttApI7tRNvT
	O2ovEzUaEvQSJUCDP7ftwU6wv8uTOPNdeVqz35SC1HePKkHFb5kd5/+jMUHCUMvzLP005E4ZXkP
	YLdvd1H/QZK3SbPNTt2e8WBziPSuGaqwco+KCUUHXxh7vYDQP4h1ZQthu+416OpU=
X-Received: by 2002:a17:903:984:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae4e43b42cmr81716025ad.20.1772563830854;
        Tue, 03 Mar 2026 10:50:30 -0800 (PST)
X-Received: by 2002:a17:903:984:b0:2ae:4e43:a606 with SMTP id d9443c01a7336-2ae4e43b42cmr81715735ad.20.1772563830250;
        Tue, 03 Mar 2026 10:50:30 -0800 (PST)
Received: from [192.168.0.107] ([183.82.176.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f0ff9sm188970095ad.84.2026.03.03.10.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:50:29 -0800 (PST)
Message-ID: <756630f0-b6d6-4869-aec5-91aab0f6f074@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 00:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] Add new driver for WCSS secure PIL loading
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MiBTYWx0ZWRfXxUhpbG+dCg6z
 eCjbpd53/f5wX/g21M/If3lgMfGFRmjryJkMpiwO7HfXQJhgxa3o5zaREwH1Pm9di2rua+IPcHt
 wyPHk4cJD/cb2Hrr9M2Pzc2oL76xCGHdiW2MRIv2pYc5worLnseWcRHHoRaj5BePvif8jkURj5R
 uBRUO+PYArCgaJOInOdiiYr862pcDxdQrX2aStnipxfViMyGLf6rJl35hO6gOYZEk3XOw2jt0FG
 Eb2/PwXtfnZPzL4sTe4sr1w4XGlNDPA2HchzWTtuWLJLrkZ504QT+ksf75+++wTeXoLgVg7l+Wf
 uwNTs+M30FneP55BYiMiCLDp10rI22XgzCseKe9L2bei108mQPai9LdLuMBZfpSscoVxAjEDwTP
 yl7qPqzu2HSRu1d91sTDHURdI8rFOAgN1JeM/bS5s2CW62FQcKYMGlly9EwNWpG21VLmDIG9Gbt
 sazSR1hZ6jHEAjtLWPg==
X-Proofpoint-ORIG-GUID: f6u5MP2IbyGRrC8FG4NT27G0aL3aX-Kn
X-Proofpoint-GUID: f6u5MP2IbyGRrC8FG4NT27G0aL3aX-Kn
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a72d77 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nh/15Aj2rvbLbjah8EXp4w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=Z0qTAJmwHQViJ36sbxQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030152
X-Rspamd-Queue-Id: 1477B1F57DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95195-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 1/13/2026 2:50 PM, Varadarajan Narayanan wrote:
> As discussed in [4] posting this series after dropping IPQ5424 support
> to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.
> 
> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> I've resumed Gokul's work as the last submission dates back April 2025.
> 
> - Secure PIL is signed, firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> [4]
> https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/
> 
> Changes in v10:
> 	- Add R-b tags
> 	- Remove unused fields from 'struct wcss_sec'
> 	- Remove glink and ssr subdev if wcss_sec_probe() fails
> 	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/
Hi Bjorn,

With Dmitry's R-b in patch 3/6, all 6 patches now have R-b tags.

Could you please help review and pick up this series ?

Thanks,
Vignesh


