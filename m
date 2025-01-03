Return-Path: <linux-arm-msm+bounces-43854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FBA007BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B3F1884B3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49A41FA259;
	Fri,  3 Jan 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GMET017M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABCC1FA252;
	Fri,  3 Jan 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899328; cv=none; b=A5oYRuPRB6HlzyMqq/72VLXb52Yo6BjDaySzpkG9n6Bf9+knFhw0GrC9hzaA4ad0GWHiIDcuzjwAIRc5S0nuW/Pscr+lXgeDc8O3igECYRh+SK+21nNGpHQFh0zy1mgHdRhh4ZBy+sT2jAtHxW9iTmugdCuv9PRX97ukh9mRfJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899328; c=relaxed/simple;
	bh=qewynhvggyKpZEEOwryOvmC/VSQW0cKUrdGLeYaEiYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V6OK0pJxMkK3Ts9VLwfKSM5hfDbEJGJYjfNTCpvxusKUlzFR4S8iAcXiCoj1FBPaczaDJhjo3IE4S04HN9uqAYQU8kgVY5KMIex7xmlzb5dMT16P+ePblDUbcUetMuCCxrvt+Ex49lF6n3bP1rfPR0DQoPkN0/YW9HxrGxq1fEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GMET017M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Kd8h010124;
	Fri, 3 Jan 2025 10:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHtkAHotMrwiNc+RHFugN+IFchPkfqLFuW8a7JP4sM4=; b=GMET017M5n3SVJ4B
	fCOcHKJZSFTZ1u5gbC8WAg/Xen6w8TOzsQv3wKoi6CJPMA5ZRrcT70Bo5orAXKuS
	Z63mtn5Sk5u8UbuT88hmpbhoNxjJkT64Ah7fnHTPb/P1DtQ9xqj1pEXr03r1UUYE
	nZUkz0vyz85tshtdrD8C0Tb83QkKEdLdLKInywHwmcajD/cYxv3i6qtTFOGdIl03
	0gYlxKiLUQIQMiDw335byj03eR8hMExrGn4GkAYLAvsn6kXIlxg24ss39xmMd65I
	v8u3tKFHuTmg6AVd5Sb3GchjPhydatSOoejT9AGTfoHtbgLwg51MmCPT0rCZ4wvu
	PqiShw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xca508qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 10:15:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503AF50f016477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 10:15:05 GMT
Received: from [10.253.33.137] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 02:14:59 -0800
Message-ID: <7cac0b93-c1eb-4269-b397-794f43a8507a@quicinc.com>
Date: Fri, 3 Jan 2025 18:14:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
 <Z3ZwURgIErzpzpEr@shell.armlinux.org.uk>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z3ZwURgIErzpzpEr@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b0fTZqk6w3PAlsxUky5TFfeXft8C7umx
X-Proofpoint-GUID: b0fTZqk6w3PAlsxUky5TFfeXft8C7umx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501030087



On 1/2/2025 6:54 PM, Russell King (Oracle) wrote:
> Hi,
> 
> On Mon, Dec 16, 2024 at 09:40:25PM +0800, Lei Wei wrote:
>> +static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
>> +				int index,
>> +				unsigned int neg_mode,
>> +				phy_interface_t interface)
>> +{
>> +	int ret;
>> +
>> +	/* Access to PCS registers such as PCS_MODE_CTRL which are
>> +	 * common to all MIIs, is lock protected and configured
>> +	 * only once.
>> +	 */
>> +	mutex_lock(&qpcs->config_lock);
>> +
>> +	if (qpcs->interface != interface) {
>> +		ret = ipq_pcs_config_mode(qpcs, interface);
>> +		if (ret) {
>> +			mutex_unlock(&qpcs->config_lock);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&qpcs->config_lock);
> 
> Phylink won't make two concurrent calls to this function (it's protected
> by phylink's state_lock). Since this looks to me like "qpcs" is per PCS,
> the lock does nothing that phylink doesn't already do.
> 

The per phylink pcs instance is "qpcs_mii" and not "qpcs". The 
"config_lock" is to protect from concurrent configurations for each of 
MII ports in case of QSGMII mode where there is common register access.

However after taking a re-look in the case of QSGMII, I think it may be 
OK to remove this lock from the driver. This is because the phylink pcs 
config called by phylink_mac_initial_config() during phylink_start() is 
protected by the rtnl_mutex, which ensures that each netdev starts/opens 
sequentially. After that, for the QSGMII case, the interface mode will 
never change when the phy's link is resolved again. So, I think this 
lock can be removed.

>> +static const struct phylink_pcs_ops ipq_pcs_phylink_ops = {
>> +	.pcs_validate = ipq_pcs_validate,
> 
> I would also like to see the recently added .pcs_inband_caps() method
> implemented too, so that phylink gets to know whether inband can be
> supported by the PCS.
> 

Sure, I will add this method in next update. I will rebase this update 
on top of the latest net-next which has the .pcs_inband_caps() patch 
included. Hope this is fine.

