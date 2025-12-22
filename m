Return-Path: <linux-arm-msm+bounces-86251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7984CD6C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBAEE3032FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F97335553;
	Mon, 22 Dec 2025 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQMnjwB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IteeYhpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF801333752
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422957; cv=none; b=iz0KUpzXNS35E8vHUhW16ECgaW6Vjfk0/IvDecEysLJfPR5DVIYmve+Clq054lhUj/6MGGvD6PYbpyHnk4M+fDw9eLpM6RYN0pOjEnsuP9wm0UJcTpmnhWlPAZYdAlLGvr1NqeiaQe1jQnx9KdGo1WB5dNGs1jFex0zDRLokoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422957; c=relaxed/simple;
	bh=X2wWtZnXX+I/oXqvtUQbyTZW/mFP0hV7GbITAwxX9Rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a3s988aP1JjergbjPym4n9jwMMh5z2kncohIgmdOHIjwcXF4s4PeYdEDgnrXIXTMdKyRpG/fORop9bhfGjE0gRCO8Heb4d+vq9jk3SndV8Yj6EuB3SKN/aBJYShgOdfErHt1WzTgsyzA8nDMWd8RRBAevjIwNaBgJdYpcKPheWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQMnjwB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IteeYhpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMGqvDJ1902176
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=; b=WQMnjwB66gwdW62R
	NJptTlmB7Qo6HsBaPOd2eYKPEY4bEAnyoIf76Cia+E+0PdYnnYjv9Oq2XMkrw6mu
	axqLCB8+1c4W2iKoXaqXIqOtpB0gCi+5T1jXBffDT5vLnT16XjvawVkpdKyAt+k6
	jdnZhIqbCj1JpE2Oa9LOapFOU48+60uZ5ONw8+VaSKoKs1Ss5ywl+SCWwleN/12T
	wFHqqyP1qTh1JDoWKPlMz5jdNRpyLvssHrQ1GLNoHPSgt/OvF61Co64N5q3sHHsX
	IeOQbU3V1XZza5ge0vnovo5SaeACEigCpU6YvMMis7afS9is6bQ5vc+4Y1hx2EQS
	pPbZ/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8g0xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:02:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab459c051so10944170a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766422952; x=1767027752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=;
        b=IteeYhpH+1rZetA3ChaEAGPnbdrOvSaXX+a4KQwrNBpDi7GPGaD6qLG07JiVTAfqe0
         a8OqTy/QlZKi6HoeFxvBz1I7LJUFGzkSzYF5UppnnjMv8sznhX7HvlRFz6WouG1KoYCk
         WcHmsrS1lgb+6iH3qQvMD09UYGWhwARQZ9A5smxekFdSC48RgRqQKguBJQ3gimDJFRVu
         EfR0t6eHETMLsck+JWSN7X5pLYnyg/ei0k2ehLDP4YEWz9TADVmnzif0VKWVKcL+Dea/
         2p6QWJcsFBaXzkjdMiYbEFaCJ0NWLI2ytaqK5CuTqjB2Jlg+WSZIxakogCj7D1aLPws1
         PX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422952; x=1767027752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yp2RMDHYd3KhktISO6jK7zhxZreDnJv8OYT7HQAs42k=;
        b=Vs2nJHueWmFICJYdcBmbwBUfnFgleHUnNQlhDzvt8S3yeMwjkN+BhXO+Xu9hdwZ9CK
         2/W0nJ0oyPawCDdGYvbLXg/gnyYe6XRUvtpMUU8VARGEPQ8PDaORUzGdcwYOAbP9Wlde
         RiIOdHV77QMMZ+F6iDu/0xIu178HZbkKt+tnKTE4b0OUPfiSblz6HqmwMFOsQvYIdkb+
         fhXi2Lq8IeRt7fSn7yGO/dVh43vTfXEXtQGrnt0q2ljqQpwTwVxHHGAx6/1/ZsSgzXpP
         jLyMz5gLz+5DNBLgcRLV58drQIlTjXceK/B0/KARfW+iXFpPeWvZuNuBuEOKldAjDWjX
         VY/w==
X-Forwarded-Encrypted: i=1; AJvYcCVVdVjw64LF8FtPDE2TdQcM5199tUwE9X34CjonNLX+pMUlLkN35hqX7gWeKyRDrlrgZKUmY8BmmaskBwFE@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwcqqGmKp8sPTmqgknJMwaJPrOIqB7FoOzEgcVW9Z0NeXIOLz
	vDxYv25bJZeXWOTmLlKYUK69IJQkFkenbEsPtaKrm0tg7lmvyfARD7BYUrb8UZnxs430SMaI/C1
	rn3mhm2iPUfhphT6MzjV0K8dCMjYRXNCtwMUOqMABCdp3jnBxfehSdclLr5O5PBEhU4Qy
X-Gm-Gg: AY/fxX5y46lwvzsymk4uKRjn+8+GI/fdslYsJ84xFM4+Qrs5wYrHUPOs7Nw6W9ungzr
	XxX9PxyCzMPi7Xldr5Y5yyOiWIzYDoYxOfLvm5kdaf0f3VYSxxRlY9EHuVPwAve8FRk+Ej7xWpV
	pcvnhsIiSIdJIs9q22uVQC1eMuh0T/3wnOfQiEodcy4mYTrQhPP8YVqzNC9TDMpSpVyQJVV2WnY
	uVPwwKNCAo/xR9vMG9vwXYCqLvpfMK7HcLrrk7Ab8xcrjqumAI+fRJKE7EaI4J3g/l6xQQsrq2D
	NGH5kZ3/SQPXNuzcUs69p+deM7dHFjp/x8PvQDRpT7PEnesqWcjSGQHvETaY4mEUkkFDxOc+lSy
	5IZCTum6v
X-Received: by 2002:a17:90b:3844:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34e9213011amr10256211a91.6.1766422951529;
        Mon, 22 Dec 2025 09:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhxvYwCBLtPVF5mS7w3vV1awrjYvqTGweCD6BTnP0tnreJxB27rzmNxHnp8YPmNFLzmV8T+A==
X-Received: by 2002:a17:90b:3844:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34e9213011amr10256154a91.6.1766422950785;
        Mon, 22 Dec 2025 09:02:30 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f887sm13636763a91.3.2025.12.22.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:02:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251222064207.3246632-8-cassel@kernel.org>
References: <20251222064207.3246632-8-cassel@kernel.org>
Subject: Re: [PATCH v2 0/6] PCI: dwc: Revert Link Up IRQ support
Message-Id: <176642294649.11053.7692165747212741983.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:32:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NiBTYWx0ZWRfX3GlTpalxqYfV
 3B4WxanHTrWHeBJUBaVk4U9FYJPVhIVsZhI+GwbcK03wt4YAy5ngD5nfCKTblO92XVDwjocBhcP
 xmj2d/0FtLLLhoP0dsu3HRwsP+1VfVg1IGL8qjxdeZu29J3Dw4vBI64PylpuRyJ7crwjFwUS2n9
 GIsf93fa3fawBro/Hz0W8f6YN5UWNaY+1aRbWhLdCIUYYawNJrpqPdG+YRc6AT7yacmbquPzcfV
 vog4Lbgr8vzHjJtcCnbRHcRRmT9OgqbXIkSEqdHzlyXR7oig0rcgOYCTbAgNQe9PsK4ADWmBxyR
 l/ji0+2JkhJp6wKL3jJwc1wZbMJM/qLxlBMKaLI28A9wB/I7z1HtCfuBd58shKk6XSdyiWmbz7b
 jl+h88eLP4tfxLxa0VXGSgtqmv5ePUqeF+nhF5zw0V7JDWjOM8J+r4eZ0WBgZ2/isjYnUPgpCdh
 NUYtr5yBK3lfyHDbLEQ==
X-Proofpoint-GUID: S9f94JyfXk_5zgEjHDLVTQV6PTio6VX0
X-Proofpoint-ORIG-GUID: S9f94JyfXk_5zgEjHDLVTQV6PTio6VX0
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694979a8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=875CWLFNMCvb7f9f5gwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220156


On Mon, 22 Dec 2025 07:42:07 +0100, Niklas Cassel wrote:
> Revert all patches related to pcie-designware Root Complex Link Up IRQ
> support.
> 
> While this fake hotplugging was a nice idea, it has shown that this feature
> does not handle PCIe switches correctly:
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> [...]

Applied, thanks!

[1/6] Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
      commit: fc6298086bfacaa7003b0bd1da4e4f42b29f7d77
[2/6] Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ"
      commit: 180c3cfe36786d261a55da52a161f9e279b19a6f
[3/6] Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
      commit: e9ce5b3804436301ab343bc14203a4c14b336d1b
[4/6] Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"
      commit: 7ebdefb87942073679e56cfbc5a72e8fc5441bfc
[5/6] Revert "PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt"
      commit: 9a9793b55854422652ea92625e48277c4651c0fd
[6/6] Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up event"
      commit: 142d5869f6eec3110adda0ad2d931f5b3c22371d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


