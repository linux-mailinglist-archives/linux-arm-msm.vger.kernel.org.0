Return-Path: <linux-arm-msm+bounces-105965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOWbBn/x+WmcFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6A4CE8F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07708307113A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA247887A;
	Tue,  5 May 2026 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+MXdR7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNQ1NPat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F030B501
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987674; cv=none; b=JfvIO/nmofqVeRJnWQU3e37tu/58RGmU93NWZk84DaKMKw5meEd3qJvtBaCRR57IkVZlpNVCNo0o/MGaKiBHUK74AgDTY6TvUGEULm5TtEipBT86MjlvSsIdOFr7BIbvgLpGI1sTLld4F2nE8AB1lf5lhGANNoeknVHXrJ6iBX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987674; c=relaxed/simple;
	bh=F7TAvKyLj3bQ7LrO/xA3hmUETtZb3FdEEZ6bOnujb08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNLI5+A4JOhhwZVdzzpxX/tk6hcgeopParw5uvrtTvF7fI2Jt9jMz8Es3uyLgKCzR6ri8sd1+pE7KfAhr0bBbIVF2PpaYSErsQJpnMT0veQ3bbsX4F/VKMFzLGn0QZ5emSou4hLLMtXUHGmfQfsuX6nM75AYUVPqFPD9qohc3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+MXdR7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNQ1NPat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6SuX3091492
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=; b=m+MXdR7m3hHbjb3f
	xSRJcRBZnY6g+vhMZ3DAREZuTB+zbnIJFxAF15UfE4uvZ+kT83h6aJsX6hb2byNb
	DLiNglJb2YDYAPLL6UboyyPZ74Du4wP9gbzs7XsxW2XznFU0/GlXExBf4i47sLfj
	A4gGhf+5UCPJWPt7k4nacqBkIhwdqwMb4D9UQ447nuAYFSTGpQ80/XyW7x3s/fg/
	XHzIvMeSxIplV+DC6EDLqUCIxmbaKfy9FXvUP338WfFaTA39i09iPhJ/PcKiNlfL
	n8kiFpOAbLTKieA6rpSPMIh7b2QwocnTWPaAqBE1DEpG/YziavvtYjpjMKWWZ0Jy
	oISF8Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct0f48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:27:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so4361630eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777987672; x=1778592472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=;
        b=LNQ1NPatwWJU0XYlCROy11k2kXWMzIJGp5UduUBW1DTGisx3vb7ODuopkwxYrUNNrB
         OXpQQSBi++/XPCaeaiSpRWr8EoObBQUuX9LwSKCj5/tlsV9UIkLnWR/YbsVbdHZkOBW9
         aJAYpYJ+chcDL3Fff7leutkRJi5eBcRNpIG4eZ05s7rzwislY6yxTllmqkAvxI//FyDd
         A7xCNrBdATauBbk4b19XdaJFimx4gSNoA0UJMP+qnh7dYg5bILJX4c9rutnN8MdgZpEu
         9T/2qyCxY+lRQbeWxSrOmVAVeNzf8MFYkyBDLlLwornhYQ7nQyiaaTbYan7yXmkMN0A7
         jC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987672; x=1778592472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cedj18wV+A5NTGkRX4FL8XkMugJBRQyPoSmH+1d/Zs4=;
        b=gM7upIt3N0b44WA82gWAPv1D3lm6UckxW+kXxB4XEHHSd/SjF89vbilDZ5r6cTxKJx
         avhLEjdbJsfeWYO/QyHuLVkpByTSlSA5Iud7wYhyqRZTvR1H+hg0DpkvqkSm162ASGMG
         WE9ikHklOFXP+JBj3GxqQ4OROr1xBonrtstSFSob13gvgVwPcEJ72JKD4Z78B/XcRhS4
         9aumr2VKJrlG1bd36HGy4P82rx6SfTw8c3T7J+yQi/qCURxw+m84MqQNfartAcU6FDSp
         cdx6rL7rcrqM1rxgxpf4l6+hUCdeWoeDejZc/YlZxMetKrDlh54VtTLlhj1lbzzV2W/b
         19Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/pVHZZp0IyqQN5eF8aGMdAf79gBfnb5OhBK6tCLUkf/61UAYbvECxIBn9hMbkp8mg1dHOTOPI3PVveV42E@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmvqS1NlJDjNOVtI/tFWOvchIe5IO/w3Blczy+rYOBg424x/F
	rNDCSiMeXmeE87eQ4UUpLzeLkO+VN+i5Qc3zlvuiSs/RlTqKfqHVcyRbUibg/PVMuQSvqsRulN2
	SDlyINPHyVOPLm+GO+DuKE+/1cVLbLFZ7NXuFQCnLpQ6MBTZKnrXIckYWE2pBDRkULd6Y
X-Gm-Gg: AeBDietZrX86exuiHCMLmskY9e67/cNbt0u23JlVZXiucWpitzrsK1Tpwdd9/E6oMBk
	Be+rqQyeABVaeY4xIC7G4WPdXbXp3ymWz+mqqL+uvdRGbQjqF1TmpLSmR8gR1ZwEFqvp7VI/lu9
	rO7ZoIKVFyHlIruKuZesOAgF2RLD9JuDVTD356EuHe6XxZw3diDCqG5dZSHGNHqh5Rr+IUHp850
	PdwuFw1Qt72he5Kf0Nz29451p+XpboSNPx9ZP8s4f0rUr2yhgdKNK28KMFQYf5Zx2YRN6ZZbHhQ
	WcsALpxw9j3e2ORgcmaVdpa7tO3Rk/SmlC7QGeJ/d8TgsaE3ql/w+vG3C2mUFcktQMXBPocBh22
	OG4C6nwVx0daTOzqVcT4lhPdFvVidHxgheUtzExZuNNWkFFa3c2z99NtbHBGkjrJAb9UqHZkiwm
	Y+TvP0wQiab0Y0MiEa/WGOsCRd
X-Received: by 2002:a05:7300:320a:b0:2ed:e16:6b38 with SMTP id 5a478bee46e88-2f3cfdcd781mr1725621eec.16.1777987672241;
        Tue, 05 May 2026 06:27:52 -0700 (PDT)
X-Received: by 2002:a05:7300:320a:b0:2ed:e16:6b38 with SMTP id 5a478bee46e88-2f3cfdcd781mr1725590eec.16.1777987671627;
        Tue, 05 May 2026 06:27:51 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.242.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5359555eec.6.2026.05.05.06.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:27:51 -0700 (PDT)
Message-ID: <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
Date: Tue, 5 May 2026 18:57:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gpOYNjKeV9sCzQ4v5qSnIlkKJyYaIanf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyOCBTYWx0ZWRfX4RAonMCLx7+b
 D620v762V6EQ5gXptPtn4s8AeZXmEkOvaizLDzMRfYXYW+dG6Zbw65AIPf1BkErAeg5ExB1Syxc
 xEFzvT72LAAwMByxJjAnSv2LBWVrwW+LgIQQP0TXByEy7FU1WGR8dgsHztUsDrIBtPi2PM5Wuse
 11L8C0K+/AXLM9Msf6b5em9wNTf2EKa9tFcrtbVlcwFDsaSCbQJLHk8u+K1ND3bLFSj5re+PGIw
 pVI0QuWp9HPoocG59K9hOy35JEdBPnP5Z0ewXaSornsX9t4YHd7u6KEsF8ymbarVYQWYCibZ12H
 abpHVp3OjYorM6OcFCPs8+ri8hgyxCePf0ZYamyp+936aFsGdMxkY3wy/97Ol/yFlHlN7WW36sD
 +TwrgXksrT5KR6r3OyWZWY8qupZTna69f1Lcfn4SZYt2UZFCVzMbkaSK4dWAxz+Z0mThiXVHd4t
 +6vOS7KXrqn1f6HZNbA==
X-Proofpoint-ORIG-GUID: gpOYNjKeV9sCzQ4v5qSnIlkKJyYaIanf
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69f9f059 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=1ETSEvoV01wl5CnlN8iVEw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iob6wRauG21zkpGokN0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050128
X-Rspamd-Queue-Id: AAD6A4CE8F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105965-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ... and then I looked at the driver. So un-reviewed. Devices are clearly
> compatible. If not, explain what is not compatible.
> 
Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.

In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have 
GCC_USB3_PRIM_PHY_AUX_CLK.

Hence, I didn't use a fallback compatible.

Regards,
Krishna,


