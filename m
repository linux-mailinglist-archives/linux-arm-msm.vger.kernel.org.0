Return-Path: <linux-arm-msm+bounces-68776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA93B22727
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0844B425D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9A21ACEDC;
	Tue, 12 Aug 2025 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjhQ1dEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71AE19ADA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002191; cv=none; b=KrZ/aZW43ShoAWXMdt/iKlxSaBo8mriuY5dDUJclTpbLWSK3bcsYnZFFtonXeJzGGYv0AgQRqmcN5N6ndODr1PhuVY4qo6kMfOf8avJ82Bpxs8L6AvtAQTp9f+k2HIrmYzcJMYmM1PNAIa6ARLCPXR6Ei/nkiPc2e2X4SCQxaw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002191; c=relaxed/simple;
	bh=kAiDSFz0Q/d0qlDTk3TH6VnLp4xgtB+kp0UcZ28ZqIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5EBkGOh5WXVM9dbPgzKimojT8TEeW4S4pwehJRYOcF+P84WLg7iYT3Oaoe1v8O8PCKt8A1Rvkrd+9vxemMEfyGqdEdH20499fwJcKgu5xf85OL7e7JjGZborLxhqwx86BmsDMvwcaQi3dWyNiYYtFpYBTdRDLJ1HO5pulJOFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjhQ1dEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAwdkm006190
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZkubqhZgKDdhvXcg8fBI/jwb8o1/f+co4oETtSIJyU=; b=CjhQ1dEvn753boZ2
	4K5bPsyT4ip8Kax8HhX4CN4TwvBl8nZ/jFnUERgGmN75Lu7ybKGOEzIKUlHUyM/a
	Fs62qoc15+y4s5g7jZ9DxRXd2B+uohs41iuIta/1FxbxYHlUI9zpu85sLYqTFxC0
	6eaVStkYvqDO8sQnVbo4+u3OAuwg9iLRotXNFu/42l7HlCyFMY017iST5oh7WFFq
	kBUtLFI1oMsePEkxx15EczbWcE8COZ5YaZGbMwvHeyfpmuPP86v6bIucZTccbk99
	73Cu9iA4jD1FDJbus9jvsMLI9hUmLHLQT/gurFa7uTxOwuPYDyoSh3MjDRiNuiZU
	ANsBXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmg32d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 12:36:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b071271e3eso13837071cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002188; x=1755606988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZkubqhZgKDdhvXcg8fBI/jwb8o1/f+co4oETtSIJyU=;
        b=f79EvKGdWuDFIrT90GOj5XU6XBVZOcNBaBl8aXvBCM6ghINxY5EkZLGolm26gT7lWZ
         +e1bmb/Hz1lJ2mLYSHQQ/RPwUK8RoTsWLuJMITU/bmSwXUW75Oumm+BJDQ4H3X841iVj
         bpIafI0/lkMch3egfQMuQFafg5CKTJenWv/qDPYCqnnr0q+GsiSvpDscRNT2lkwkrPSr
         GMF5maAS/f0BAHLU9XdZ+mJgtrssvpHdXgMkPQUU4KqIy4CcNJtlKGsVYyjXW+pF4jT9
         UXHbfWDM0+3ULtR/fU4r1bVYmYtc7kqrCQJN7yg+MgcPwzTl+0NbF1cxi7A/60Y9RVe/
         USBw==
X-Forwarded-Encrypted: i=1; AJvYcCWcenzrpIlKXYBJekMl73SKGLo7bC904FogQ1lodhXbT2P3F/OoK5nS3LUFcU4uCg7VBuUkUmZ2GU+93+sh@vger.kernel.org
X-Gm-Message-State: AOJu0YyITVaUmS6q831ZIW7ZzRZWRaC7l7KhhxdNoGb2cvnXqqd+ds56
	gKJPtDMrkYhtubo2IB5yoDxWzwEHDn1BB0fEG1uoylHEr4Vxwg74ysA+uXj+KB06Ld20/NzC5M1
	So0PCGh/o1X6LS2/K2Wx4VQJrIo6pYgoi4pXir8Oc6uvzUfXpob69hFihZG4OkpyuGFFD
X-Gm-Gg: ASbGncuXCM25YfPYx+hkCNPiC3n3JO987CaF0FuO7JgBQVSqeHlUzrsxY8EplQwbtNf
	2xkT98wQHq9S2u9RrPb6HGwI4P2sF8J4C4dCcmDVgVSuGIaMMbwCPfH69BHLWa+JCkDalhIH+Cm
	gJ0zW1vK4JlC5AdPSdEHylgPscqAVjAgFiKD6smAFVgRTcKzydzzAu1rJlOzgHpzJzbAYCy5CG3
	jC66RljU8VtiVRtmc+lQWVylOoFGrPUsandiQnp/IJBMLvr7HTf8yYq00SABf6rwp7OdJa5iqZs
	vDlDUSPUpcXhvOdJvLdA/PSu0PvPXoWGiJzSNRAvkbyahHlDfbl4/ZVIKBMI0JqWLeuesB0s8Ud
	VNCEWfadKSysYIYsJUw==
X-Received: by 2002:a05:622a:4cd:b0:4ae:d762:c070 with SMTP id d75a77b69052e-4b0f4944fd2mr6895941cf.2.1755002187494;
        Tue, 12 Aug 2025 05:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9ZC1n117TOHBtxiWTNR1pyodPwWUGh0sBoao/x2KAU+BBH3o3vDCMHVPAmEmwyOPtd3opA==
X-Received: by 2002:a05:622a:4cd:b0:4ae:d762:c070 with SMTP id d75a77b69052e-4b0f4944fd2mr6895791cf.2.1755002187028;
        Tue, 12 Aug 2025 05:36:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a37a8sm2207820166b.40.2025.08.12.05.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:36:26 -0700 (PDT)
Message-ID: <4ac0db96-8107-4809-8b13-580d75948ef9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 14:36:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Shuai Zhang <quic_shuaz@quicinc.com>, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
 <20250812113620.3135226-2-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812113620.3135226-2-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX24uLhJMR16FN
 +MIsBceDaLk2lQ1vjH4Ye7lMf+FjEQy+CHCSiDOhOf+bJkuxjGV3knhNINMKTEerZneOJsYOj6p
 VVkiJvWIzrGBVi0nDvtPWnHCf9Y7mFxD7ZqYIJpU+TrQj4gywpKU17cBRByyqFpDuWR9RnMEm2g
 t2TYa7OqVegMxfqB2YZaqcXv43+MCsCHqPuexhHpu0O+Zt6gNsPOn0o0g/lF8egDKEu4y/7/swh
 rXWA+NOiGceBQa3GbL/Uo03Wa3M1p881kkiYmV21L6MYdRd7TDT4NrE4i0byaDxvG5BymscStGZ
 dDiPheKK6oIhDWDHMM88wsHZPxwxdpFyF4ptEdFU/64yfGtzcRvQB2AP4o/lyyRjOu33Zr9/A4D
 yzVS2Juw
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689b354d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Ok9mJCcS3AzO1ZkSq8AA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 31xKGKcafSeHB__XwSL6Ljonmby8xEhT
X-Proofpoint-ORIG-GUID: 31xKGKcafSeHB__XwSL6Ljonmby8xEhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/12/25 1:36 PM, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However,due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
> 
> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
> because this quirk is associated with BT_EN, and can be used to
> determine whether BT_EN is present in the device tree (DTS).
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---

I have received this series two times, you didn't add a version
prefix (make the next one v3 so as not to confuse the tooling), there
is no changelog and you still haven't added the relevant people to CC.

Please read the internal guidelines at go/upstream and switch to using
the b4 tool.

Konrad

