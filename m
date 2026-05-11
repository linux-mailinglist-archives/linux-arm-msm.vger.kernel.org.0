Return-Path: <linux-arm-msm+bounces-106891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNsHOIGvAWrXiAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE050BE6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471FA300696B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC03D523E;
	Mon, 11 May 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ciT4VGOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLNUwFye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0663BED7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495358; cv=none; b=aQ6r0f2x+0YNr6P2k2qQ2aOosmYt+cqsh/RoMebI9Fh6I9WXdk4jPP3oCJRVwB0LcLWH2QcafdaWY8tdvHszicXWKC+jj0wxHx4/n/Q0prFPU9cDQa/9jlpc+QMgSd8zSgmgb07fJwsQvHnPOZc6CR7fmo2FO/IFilnFZ/EU2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495358; c=relaxed/simple;
	bh=BWsV/v8dAleHt6SPohPfZYmWWFCts14SYtui33lnaxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kURC3aKzNZH5KYlNwg4ZyQZTYP13D/CoCqEOWtWPlkvkcw+r5XeLBWiMctpTYSDJ/Qt8Vv5gdQAwuwlatNLuEX7zdb1X/kmt1W2axK6e2jAdIgkQry3fWIKl/2Y03QpOV2fl/zqF5r4aTzm+BP7adFYt/uxLfLrZcmoMbK2v1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ciT4VGOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLNUwFye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9I3ld017280
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S/IcUZ9Xk1TBMi6yw1AkVZsDtOla0MSA2CupxfF81s=; b=ciT4VGOmgd1qvD9I
	8VOuMFxPfyyIB0+lpeLNPd4binf+UXTi/HEK31I3hFMIaqI7TdNspA8QIM2ELwWE
	FG5Ni5lUKhRb4So92ZfLkCPDQsZs2lBZiA1Dukt1CcwJ3u9oEGlIpyREckrcT4zs
	5mSlWc9bABA8UPIC7d4luI9qs0J6rNg1dmaJ0zmtiI/gPgxjy2iE7VNFOew+sfT6
	wFa9xE1P8KSLh6o+KsAZv/BB5DfMb9a5uWb0TMT4nigs7iOPz698QigEN+j+lNuj
	aY3VWSeXB96A1AFX1wQo5fIxZDOAPE+HrC1uuqS2fDQK2vsvfX+4xLLGUICMJrcw
	u55wVg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfs9yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:29:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575b631c698so31792e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778495354; x=1779100154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8S/IcUZ9Xk1TBMi6yw1AkVZsDtOla0MSA2CupxfF81s=;
        b=RLNUwFyeBlbyyxaVzI7S9GqzDmoJ9tKRu80tV7p2kzKiu4JWtMj54Pb6Qrwgf8vB/U
         gaguN8/hy8XArpvLMrHg3SY2ELZsI800UaQ1IKLvZqItvBjARHY63sywx5qgprfoGuXR
         8gAWpJHUKpXNYIPx0jVE2LPCdCxYN17qiORd1UsH5LUGoLBjdHMQnQnlwQ5lX1FOMpBD
         VJTZ3TYXm1rVV9gqubqfTcVEaRvEp2wRL3Qbe7/UxEmfmV29KNxbI2pWz71+6q0pF3gX
         ecaXDDZ0zGl3+1OIeiIvmuRGQKSmUkluMu+VFkHKxvbtKT3T0+FuyXyjvzPg8zLTwBrx
         NMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495354; x=1779100154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S/IcUZ9Xk1TBMi6yw1AkVZsDtOla0MSA2CupxfF81s=;
        b=RcjShscX4a6MFUMDjENjGON0P1faBRKzhqaogFisWjhd2pdj1LqPGm7q9K2wRge2ta
         r+5AzM801IlVZ0Vq0uAYlJM0NL2GgIG1qQ3yur1pdY/3DxQsPHDbN9wOgLuP26+ylkXz
         7j30QGM27rw54IzjGNeoryc/q986AHrhR7IiIoI6nEO7AI7Rp426Rqrvpr/A+GKHiSla
         0qBtBljhjcFDMROxr27ou5qcd3pwVSJNCsDTqja2NkloCITqDqzFgHClzdoyu4baXL9I
         zzCkN69h0+X9+fv+yYOmYcQc/rj9h7qzJ0Qi02zsT3R6SYjDR8DFUrhKWOfjrblJ6qO5
         cuSA==
X-Gm-Message-State: AOJu0YyI/ejySgLQwKzK+zMM/4COxAqLcjy2w2Cwt5cNIGily1/MCZ0D
	4T6LfT+BSDddtMHqvgYF0lLrGEedUpFy4Keh1WgSJ1jJ88j5TzX8UdimQmNlahMK8zS5lIHmEjo
	c2/3eK29SyBlAQJ/qxwoKqfTSWwbN8GTFLgj8t7z2G2EBkmlYEdg9lkk/VWnrD3Vl0Ed9
X-Gm-Gg: Acq92OFl4Xx+wIIFMFbz8tceu/YIjQPibmI40p2Q6M/yBiKua2s+6d8lRM1d3h7GuN0
	I1QbbUsnI/ht9ZzMRaULd4F+QmyrGC4NLJJXowIL9nt5X6o2rlk2Jic3pifKYcV87KqFp+1y5Qz
	YMYRFO2+hC9WxA6dmlTBQKo0WBPjsglouWNsmllJuEU6zVfI/iM437IdqcRToiVh2wkCIvpYeJ0
	aNraMyQdY+nwp1ID/kxCRhxYP0Y9JP403blN+0eslzg0HE7HA75qIVa7lk2ezE2RnFsXoJ+LU94
	ZwtZmjQ+AazB13vKu+mbBEIWL6CZlNOconesuV1F9E+emxXVzKeYKnVUC01/urFsjfvPvP2mpOy
	E26UsKvF/VXSHm48cuaeRtJ4mPkawDwUUFFPPt9IwNLOisOzSjB9zU86BeWAkOQkX9T8uSRN7mM
	bU6xgJq3DkN1OWiA==
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3879720e0c.3.1778495353705;
        Mon, 11 May 2026 03:29:13 -0700 (PDT)
X-Received: by 2002:ac5:cd48:0:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-5755b4af80emr3879714e0c.3.1778495353219;
        Mon, 11 May 2026 03:29:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcd9decf173sm244707866b.43.2026.05.11.03.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:29:12 -0700 (PDT)
Message-ID: <d5539f0c-1072-41bf-add9-3c1da49e9244@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01af7a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-fIsIiFNM88_Lyffzp4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: sZ_5_h9CzSBnlrXmRmPKvXmn4VQTxbK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExNSBTYWx0ZWRfX0Yoi1a9GONuG
 UFiqyUbm5TGPt4VrAWmRV5vURw21tKIMP+3kLjFqsWjbF3rIJoN6gzHW77IPSk1OgEjJOleyEKS
 xa0bJQOCLTzgn6SpNoamlrwEcEfurFFzKwGaYr/blRDOwOWisE0ym/9wcbuMcZ6lKZYXiu955J0
 yHsht/zvM8uUTW+n0kI+//exANdXfAppB3ytiCrnbOlHJeoWCibSVWrEpQ0n0HEo0SKWC51yzBs
 Ssdbd1dgWqhTRJGj0sAOGq7+fb06/vgeZFsfeHrvdzE/in9mocxv1lQjc/kUxZN/C9FLF5Vbir/
 k+9Hw50zbKmOQxNDE/c2g/KZFM/fxA2Zc8nh7pqOY47oB6KN/r4FVJQ06/mjLEkFcerYMkRqqfa
 eHZNrlOP7LmyZcBLn9Y/WwTAP26ThgxQe/46EaBTIlVtdSS8fz0eOc6B52MNkutHL+Ta4VwTuNz
 0hCUhfzVAPZ6Ldm91yw==
X-Proofpoint-ORIG-GUID: sZ_5_h9CzSBnlrXmRmPKvXmn4VQTxbK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110115
X-Rspamd-Queue-Id: 89AE050BE6B
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106891-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 11:54 AM, Qiang Yu wrote:
> The driver currently supports two PERST# and PHY DT configuration. In one
> case, PHY, PERST#, are described in the RC node. In the other case, they
> are described in the RP node.
> 
> A mixed setup is not supported. One common example is PHY on the RP node
> while PERST# remains on the RC node. In that case the driver goes through
> the RP parse path, does not find PERST# on RP, and does not report an
> error because PERST# is optional. Probe can then succeed silently while
> PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
> silent probe success makes debugging difficult.
> 
> Handle this mixed case in the RP parse path by checking whether PERST# is
> present on RC and, if so, using the RC PERST# GPIO for RP ports while
> keeping RP parsing for PHY. Emit a warning to indicate mixed DT content so
> it can be fixed.
> 
> This keeps mixed systems functional and makes the configuration issue
> visible instead of failing later at endpoint bring-up.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 9fdfc88ac151..8235961d692f 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -282,6 +282,7 @@ struct qcom_pcie {
>  	const struct qcom_pcie_cfg *cfg;
>  	struct dentry *debugfs;
>  	struct list_head ports;
> +	struct gpio_desc *reset;

I'd rename this to make it more obvious it's at the RC node.. but
rc_reset doesn't really sound great..

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

