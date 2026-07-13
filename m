Return-Path: <linux-arm-msm+bounces-118873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Qf8MG5BVWqUmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:50:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EB74EE28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:50:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E/gg9+NM";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PUROR6P/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA3EF3120FA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820C835AC00;
	Mon, 13 Jul 2026 19:47:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C47B352030
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:47:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972067; cv=none; b=W2mPAMFwjFC/773/Z8Rnp6lMXwqFR82QtXuu3v2kBmlAk1JIex3+JuDgnWyCmJqrhhSSjbBpHjYoz7I7DZ8CkxFdJQT67+/e+cFOXzuUzxjNvtNaToqUa3DJmVAzZC1MpbmKcfne44Uvi30Xal0ENbBoTcdO44YLw3zI1NcJowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972067; c=relaxed/simple;
	bh=Gyg+X4oTM68MBPwzPDsOfJPQiDrapGPHKUYm2GSqCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R94ghClqD7Ieob954Y9hXM4fv84Eywd/Axa6Kw9EbivqKGxMhdpxcg1pJm0J/+ySgI5Y/bEyT+32mFrYjrexsnaefdf+ejVfewuY4zt1UJg3ksdJqzHZvN3tmm4wSN/gi+Ds9SzYdrwBsGrns2YtNoFOB+Wnme9y7TLnTMrUEHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/gg9+NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUROR6P/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Gda2470593
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=; b=E/gg9+NM7cdqU6GK
	J1bGF6571fqlPr11tx0ljupGSTx+WHiufAYJ0CWbEGlT9oszrTgyU+z9FAknSGwy
	fG9jvps2RIE10yGfVj2sWn/RcY8J+JeBzsMePAQJVgF6/in5qK7E7c1fTkvv6XhF
	cSG2MzLBtd29VIrn8aHj7+wshe1L8u998/J6n1ewYeW/yUZ1r+nwS1ky7lk/74b+
	AdR2WG4PBFDPeLq3sJYZyGo3Z+eF9xf9+oRcovn8qc+W8YqS63VQisAf4yQaoOwb
	46FcO5uxfjisKfE5RqYIzistF+zZ4KclOKJJMXUzyENA2Vm344ngFQJMnXVmPosR
	iwBOMg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jrjcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:47:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso8980234a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972064; x=1784576864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=PUROR6P/tEuPBKETeB4ibYNkd57ZFwYcu1HJaVUJ+OJmcbOfHB3tnFZVkeHz0pDYNe
         9FtXfewmjY9qrrVyI78WnEK5hML2dfXDB135D3EBVf+Eit2eui6I0fodQrNODee48xDt
         43oYGMX5fnowMIk2tf+/JRntgxXCvYmQm5L9V+OcPmFwdEMIwy3Z5WG3QJjg2Sbf6O7D
         01NvP7/ulDqkyk78qI35LMrnpeNU0HE7wgOqRB1koxRB8Et619VHnho17+ZqxPhHKgOQ
         DBsCsHpm/OxNzhrqwAjclcFnDLoTbi5ikjGWUoC4qojGha5YbnFzX0dJHO6S489zMDJZ
         HYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972064; x=1784576864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=M7Wx92+VVwJv8F6GVJ0ZxlFc6CB+6CCBZJFemuPlT0DMZiMynGa1Xah8KWuqe3JGXB
         P7u14+i9fs0ah8igBaIv2YqcE1K/vFoJoJseNvs8mCKbMhxNM/BIBGtKcDSQmaSqJI62
         01FQ5CK6Yoa5LXaa1x0oAn2pgCJorFOBhxngCC/i39b8WxY09ywSSDZXV/maYLH1FZt7
         RMsKjWxdYlQWUY7vSpse9IdrRROfjJbvkJ2rtc3Dia1PmAOHypEvhsVg2BDP5K38MG0n
         oxNygRF6GynU6zqwqeipJuAHVsZyOywPixBn0t8AiyhTc0s7D5Q/33fsfEzFiK+bPGmu
         yiPg==
X-Forwarded-Encrypted: i=1; AHgh+RrRZjUDByzmiI9Wmg1gZEmlIyruthjIZ3lpw/JCIPZNXHEhpDq9T3MXA6iUmBY4hacJtWewhKHlswRErAJr@vger.kernel.org
X-Gm-Message-State: AOJu0YyncA1S+39HHGzixawqQ+yP4DOBjMPTzCux3ae+q1AdkMj7yfDW
	w1aYSO8YGue7mGMZNHbZyneWIYp0l8wCTKY4NCzqyKwoIkPcz7iABWcShMhUgfCvajlWRJICt/f
	oz/n/nM8WJl/9fu0GzYJflVSF/C8/Q/nBebJIm0ijnQplCJyBYCsbiYvuB/33/ti3UR+6
X-Gm-Gg: AfdE7cmw7eXdCpUdFUJ6a7oNDxuokGAgDVbl0XYx+WRCYtd52PhYIVF0+XGnViRrNCD
	okO1lIzUyxWrv6JsKB3cTq+ciSdb1v55sPmbWG1gWBMZupWOiI4K4ystaw8eqywt7dha0x315PV
	jRxKOkMI5y6sLrR7fwDZkwfTTrt4CiXVy+mBuW2PJnvB44joRA/rHxJ0NEHvVevgZXdWzM/CpXx
	9ahubVprGxk73NJutyDpM3wy6dEIJBZZr6xBInUjHEDPbqng2edii+Lf210Od8yrAGkp791q8g3
	ng7FK5/KLMtJcjPnVUbRPfwt0gYpe72TXUr+0k7hRsJ6nXlpFsT8yN2IJycPcsxW2fgIoG0y316
	TyuS4/kd+elIk+wH7sZBkHC0GzD3c9jNWo5g=
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454876637.70.1783972064010;
        Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454838637.70.1783972063592;
        Mon, 13 Jul 2026 12:47:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba45b7049sm6823350c88.12.2026.07.13.12.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:47:42 -0700 (PDT)
Message-ID: <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
 <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uRQ3r_y743U3_NYvuDHYkSHGmH07RfJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfXzVbZNih5CIai
 lGIu3f6+ZXRkIskxYe7dWd3EqnRpNDRrY3zCjv3JuiG60ObBKtEXowf4eA47P3CZ8D36GFU0tSi
 TpNz3vNBbCZF9l3yEJ8DnE4C4SlhXrldXmv/aszXD49gy2ihYYz4ffFEfJX9AXHZ5glYBYmh9cz
 Xfm8wuoWp9HoA60utL4WBZt98AKIWHmWVtRsd4F5qaWwzpfygy0uC/7BjvhbO94106WemNgT0/R
 017EQ2X2P6lsReuLYkTau1iIeQLAesQ42EHJwPFZU3SfZ4H0jMPf52THxgN0xLgxbXZOjbEm7a9
 4H+e3AYjm/DH9G912o3eNxzsQo8km/H76Jlv+6jEJyOMdtJ7EMsdLkGI4qOowSvHK43H8sGzA6s
 ZorBlWHG6AYJ3FSLqRtsSeyEyLXQUFJ2u7Sv6yp8VUqqpNyTezTTRPcBbpnVCiCZNI2C85ghV7n
 MacBwfNG4Acc4wYxzHg==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a5540e1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sy2TSPCRsGNh5uQNLmIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: uRQ3r_y743U3_NYvuDHYkSHGmH07RfJG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfX5rU3eUBS0B0/
 iqsMYfaEIIcq7bK0LhH009Bf3CiOuh2vXpLVUZxUAcyF4oelt0zh9NS1I2ptP2Tb6lsmSiHLmTt
 X6ka+0gh3lvQ03zvNyn3EiqopaOx9p4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-118873-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C3EB74EE28

On 7/6/2026 4:38 PM, Konrad Dybcio wrote:
> On 7/6/26 1:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>
>>> Add the nodes to describe the GPU SMMU.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> index c5635f22e2a7..e5b8377e6c3a 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>>  			};
>>>  		};
>>>  
>>> +		adreno_smmu: iommu@3da0000 {
>>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>>> +				     "qcom,smmu-500", "arm,mmu-500";
>>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>>> +			#iommu-cells = <2>;
>>> +			#global-interrupts = <1>;
>>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>>
>> 674 is the correct globla
> 
> (modulo the issue i explained below)
> 
> [...]
> 
>> This list is not quite correct. It must be sorted by the context index,
>> to which a given interrupt corresponds to - the driver relies on that
>> to give you information about where a context fault happens
>>
>> Moreover, I see that the interrupt sheet has the bug where some
>> interrupts are offset by 32 from the base vector, and others are offset
>> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
>> out which mapping is correct with the right folks

I reviewed this and looks correct to me. Also, this matches the
downstream configuration. Did you confuse with Dest Port vs Vector ID in
the documentation?

-Akhil.

> 
> Konrad


