Return-Path: <linux-arm-msm+bounces-80828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 36498C42B3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 11:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6FADF346368
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E132FC024;
	Sat,  8 Nov 2025 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blnBVAm/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3HRuwDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8F2FD1C1
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762597460; cv=none; b=qlELq5Ruf8RgW7ZIeQcwVQppQ0pLVV6E/4ZgM6BXWg/9x0hHetcoRUaWYhqinGz5i8cZOfrqTeEZksx/rUpIwGArgFM+jJ+cmGd1ANA4fhtg2nBR7Ln/2QjWsa6lylhvaXI71IyyFqXDuHUJrGjh1O5iE4sxt5w/uJaeo3F/ZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762597460; c=relaxed/simple;
	bh=OBXQyyiRnV5P6T4/0rso05iYgsLlgGJkTVAJYjw8Auc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e5/PaNqOqOOmss89dLUGW+7w9dw92u7A0XziEFD14n450TTgbS/6VHyqVLEsb0GcRFnb0two5mbrmQHY/H7oHZDDB3FkYo8FbdTVrMl5WqrWRNRmFotbMgL8qU55MMxq7EWaAKp4/OHR6CIY1U34t4+cWZ7I6q+clgeoRzDq9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blnBVAm/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3HRuwDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88PDCU1245997
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xFvCakMilUVUKVSlDxB2TZgTXXCUk5m7R9Z4TRMH/Q=; b=blnBVAm/LMjW79N2
	BjyZEYO5lnYHyBZOYYfeRUecEoCfb1NcngKXvAd3n4fFoYCo4va5TspyBdH5kv97
	XQiQ9np8mTURoM/LkiLi/xxeiZ17EYPJrXOY6z4wq1L+4b8zL2ZJeV3AActd1Si0
	Bgp7ldB7pguhayrvJi3LA5Dda2Qwy0VghfHzrGOO2DGRorC3/Q+yiKJtnILb2sCA
	VMYuci7yb4KAu6n1tw7nkdUEf6uK1VEvNUw5rg9NzTI7UnHAe+OeH9EQPiVYKiMy
	eCw50/Q9g34txXNhuR2WwDvdy5wpUlWH5zWKZAFlM8Xz17sSj+bVFKj9T47EOlGh
	KGEcFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y56rce5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 10:24:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dde580c8so18736775ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762597457; x=1763202257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xFvCakMilUVUKVSlDxB2TZgTXXCUk5m7R9Z4TRMH/Q=;
        b=O3HRuwDdvisT7hLjVLoBWbaKZkqF7r6uSetaDDM3Nwlm+Tgfwv++hqo6zSv9kRP4sS
         uyYE2U8shCFvsna2TfVHKpHeMJWIM6etYuxUv9IF02kgCATUwUkScI8oHCDftiOtrrh3
         vNMO4iryxbHgQpon+bsAdkACbG8Ia0CZvELNSbNZsUHSpLoMGBodwsUXnpD+4Y1NN/EE
         1Fk4jeFhsE+kWeal1b3OjO7W9e2qJnuYuuBPLhaFY3HsWJQIzYSlD8QqUGTjpMCIAanW
         91FHFZwFPDe6aaJWEi6L4X4T13dmkT2JKYvlqEQnhN79te47ACSoEgikNMO8lnM/F+DL
         5Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762597457; x=1763202257;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xFvCakMilUVUKVSlDxB2TZgTXXCUk5m7R9Z4TRMH/Q=;
        b=AZ9c5PT2TnAYJz/8psLTO6HlYlJ56x1LYk/TetLHGkTjqY+SBfYGAyprBNMrKyBc03
         Q2OFFFBPhuhPW2h+knRDAKep1oFEm/IQ7sfAH7j7FA0IZM73iRTs2HztvNpmTebvNBg0
         V9codEYTZJ+qxhJaXQpSdPzf9rvNZ3tteeuwkj/nUS1Rb1YZxthwxloawzeivcKXhDkB
         F0P0z3y6FzX7qADSoFjPMQnw6+UwUbkkPV1V8++/C3MJbLoiN/akem8dXsYpaWQkk8BS
         hJ09yYyZ4SN+wBZrwSMbhUSXGO2G0TcYp0igCJOitHDq+UdwEK/gTwTYQaN0AlYqNfyU
         Jg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9t6GXCq9Zl+QdYHFBEjm0BhfPnofLZjF21ONeZqShSRQ3sFtHUJ2F6svrBorZmB3amv52oLPDk/G8wcxm@vger.kernel.org
X-Gm-Message-State: AOJu0YyBt2qBTqwpRPNWPVA3+YfqIlM7yBcXQLRNmHP/6oPzlWlhGP2z
	AlnWxx5/25csS2Ws819D0zVtbToY80NZS1VLjGGlQ4itdulMiBnBItDWsyhaCGXWmQ+NzWbcaQe
	eBHDzDPaWoZ7cYkUQV+1QUA5p5bGvhIivZo5e6+X3dF5BiRIv9bJzl4zyRx3dCyy6qAmX
X-Gm-Gg: ASbGncumfSvjCILsU4mp6tTmXfnA0Pd1fOXlrlZwR6LoXdhPiXxqztXZaz4N1aD5HUD
	aaaHCJbIOkFni674Fv9aDejGeDe5y6skI40cRayfSmhp4kkJAG+yXbwSBAaZXVa13erjHE2HkNM
	0pYYC1h+az5CdtgAILlgjoDDO/1UoMO8aej2/Nq9DA7nVDfWh5uDusPTG2Ow4KoOmbvyBoQGiKM
	qUq3w9MCB92y57rUvucj/X5dGcdzUf/p4bswCcJL9egomfN4yljVr/Gw9rk5fvKQ0+XUZ1dd+Bd
	Uqo88+jaJwGLT3ezEDcR74h92pEdbwSjSrCM9hF+RG6CwUixMR3kUk+uuUPXp3qrUT54A+oyFT4
	I
X-Received: by 2002:a17:903:244a:b0:295:592f:94a3 with SMTP id d9443c01a7336-297e57101bamr23225665ad.48.1762597457425;
        Sat, 08 Nov 2025 02:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVmobcobGX2Zse5Wk8W+YonOcSi27oxPV5RU9wiYnBEochW9/Kr14E5FAmAOovcotaJUKmag==
X-Received: by 2002:a17:903:244a:b0:295:592f:94a3 with SMTP id d9443c01a7336-297e57101bamr23225465ad.48.1762597456935;
        Sat, 08 Nov 2025 02:24:16 -0800 (PST)
Received: from [192.168.0.104] ([106.219.179.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffe3616fsm7641324a12.19.2025.11.08.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 02:24:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com, vincent.guittot@linaro.org
In-Reply-To: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] PCI: dwc: Check for device presence in suspend
 and resume
Message-Id: <176259745262.10508.495485306102349892.b4-ty@kernel.org>
Date: Sat, 08 Nov 2025 15:54:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ny-ckTTuq_OmqPiZgIRJlM0i4c92-x9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA4MyBTYWx0ZWRfX34gi8spjKdRj
 /hJliXee+0cSx64dH1QoMWiJ63j9Xb0FP3fAeuKkMODAreh2rIrg1VtLJ159xkz6DPoF1K83nck
 0RA4KAwHFN3ywR1ci4EPmqQvQhdjOCasUngNEmdg8GHFkZR/Sfb8KgxRNK1G+qCl+FnKA5YxDE5
 8HrdNlZEOgCQAhnQjj1Pwu+TEBsoNoze9wZKKYjiAoA4C8AMiqHsdaTgiFbiHFb6Q4SnOeKoDU8
 sln/NkhWVerftg/+zqm97TQio31jkSEgesZYfFFA6flBXmQ1ia+pDwnI7bMZCfF2rVXPpYnnZw1
 LXWInM+mLPFgigs4P4+qEwB9HwcwikJBmT4r14iQz/DFAB3icsjyMWu4vBSspxQQS+LNq5/rixd
 f3Wj5TA9ms75+ZDvuO1EuiVRqyMJsQ==
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=690f1a52 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qronr9GGDLuyXDLutoyxMA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=5zNQnkP-R6VSWKDTgaQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ny-ckTTuq_OmqPiZgIRJlM0i4c92-x9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080083


On Fri, 07 Nov 2025 10:13:16 +0530, Manivannan Sadhasivam wrote:
> This series aims to fix the usage of dw_pcie_link_up() API to check for Link up
> during system suspend. The motivation for this series comes from recent
> discussions [1] [2], where developers wanted to skip PME_Turn_Off broadcast in
> dw_pcie_suspend_noirq() API when devices are not attached to the bus. They ended
> up using dw_pcie_link_up() to check for the device presence due to the bad
> example in the pcie-qcom driver which does the same. The usage of
> dw_pcie_link_up() API here would be racy as the link can go down at any time
> after the check.
> 
> [...]

Applied, thanks!

[1/3] PCI: host-common: Add an API to check for any device under the Root Ports
      commit: 64a4b36d229120a71ede91aed16519164a181c13
[2/3] PCI: qcom: Check for the presence of a device instead of Link up during suspend
      commit: b6811cd64ac54fb2426b6ce35ba7c63588402687
[3/3] PCI: dwc: Check for the device presence during suspend and resume
      commit: e8fe6b3413a1b92b4bc0f0182ea4b49ee369541b

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


