Return-Path: <linux-arm-msm+bounces-100237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDcKGd5Qxmn8IgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:41:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2B341EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35602302F7B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6324F3DBD69;
	Fri, 27 Mar 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtVXCx3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jupeu8DQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F503D9057
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604244; cv=none; b=YcOC6JRIALX/msHU6fjEb55Mm+GOPDaRdbpoGlU56nmp7DKtCKRb1cTz+kk6IiOoElf4GiggWNUZDXIG45+RlFr639XDFTmSyhjh0izr+LICyzyYuzevQnf5NJ7hT867jFFrYZN2cK6B2KXQ1/1fPtiGf1UIbZlDSVqOkP0hvzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604244; c=relaxed/simple;
	bh=QVjWxoIhSWsWeVvlwSrxXKaecHVGrd43CQ9DTfwQJjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0saKJ0T+B2J86wHcaia/VlQpSeEGnRlGSSCYdOnoS2EI9+J1ilu48SWEx21MgDCVWXiYvJKWpw6JmlNWU7ibHbq9S9dds+T4iNGm6NVVuMBkw9V8MzrPGo/qk/oPRp1b/fDQZd78Ga8KhGqN1FhP+hljKzzSgVMJsw0DdosVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtVXCx3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jupeu8DQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wvUj2846497
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=; b=NtVXCx3DWCsrm8px
	sPRmCJxUAGYZrUu+aeholz+Ol3Le6y8vP+1kzrfps4Xp09hQqUNT6834YrbzWow6
	RrnEwI/SDThghV85i04+ZbNnBp3fvKvs/rFjHK7yK31wkXC5NJ74j7xBKY/NqqTx
	Nn2juPFSShbO8n+ujExFYR1Hs/hgUgxLVlkHh07mvA1ckEkMW4ghquCB9zJkv+K/
	QpYAUSEK9yfMNLwcr+RN3LN9L+zXz28mjR8G8bmdtU52cZZ7c32XQ/ApiOeUSKmq
	7H3uGVjURATxjKCAXk1XZD4E6zwg5Xl9ZjmlYirOY9PI2bWc9cfj4u4NPRI3asQS
	xVc4aA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmeky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:37:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4bd8e77dso5297761cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604241; x=1775209041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=Jupeu8DQTbcn4HwUXfcevx1+2WICIVSBRnALaKjyrIEnxDmIkp6q5Y3v5NK3Ojfe7W
         V8Xh+/1H64o/SCF8C9FSG+niOQF+Y50oqlrZKxmi1uP9KRQBgvPZa0vJ9WGjQPvB7BC8
         r5CZbF2aR9p9fI22eUaZ1ltQ1TXbm/eZ1zYutnsBMKbrfNgTiNm5lk/qPPb3C9GSRRV5
         juaVMhdlBN4S/fvGM3b0mxq50vn4qmjVBNIl7NZDmz6oNbenEvyCtMTVGMbUcSTJDWKu
         IZngQ1lpNh9FplEy8dqqMU4NeNkQtyJsk+nMdtzXLtH7qeWu3OwqaS0h13V6LSAxP8/f
         N/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604241; x=1775209041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cza/eeGjnsoLjFeS3IH69wowfySQ2/ms6ie+7awQcv4=;
        b=NGE54Kbm8kOaotaQFxsLTBImYE9z3dic4Y08Q56lfP+qhmFRg3JLhiucj4W2bZ9t+l
         O+xZKHU2sD0c/EOfojwsMy8MHwHIwPYppkD6c3OLLZyX988fyEos3Kkm0eTlUGeWWuuc
         iDPtLuPleQo9sgsUG14wa8VUDtiXpCPFybdu/q6Iw8mYG72fCFE233qIOlth5m0F84ba
         ojcS22ZSw03uHoDJyXCSedX+mNi4fIlTQ2bW4B3FmC/jZNs0VXEID7/ZmghDJIzIxfSx
         dq5frqOY9jF7tzsPFeMLM6DTPd0rYRkXPryQXBgB9OPm8EuhU3urt/msYLTJ027+oRq8
         KkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUid0kZvLnDlLN00j+coMNbBeQUKYiZRkhKajp2PaB3LVCtyUbe43A+x3QZtb9NRm3PvDhilQ49yCM33XN1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9qkW5Gi3xEvQNdiVkl09qwG1Pf8Nto8wIQRKJ0jWIBnW50T6K
	ld0mgGddHkLstGUI7/3JLmIf8gtATBrVDSvmxs0Z8Do7gZmFlqf/E+dnVrFIIUtf8XpqQgLu5ex
	GPHq85ZPtD5ZM1TKGesEvNfaTRcjprpylKkPjTkhhpU9AJxqSKO54powwld9rsRu41Ebu
X-Gm-Gg: ATEYQzyAaWQWURS56XkcRPgaxSdX2XBYIx5zHGNGUk+Gj2KGQUqOsHPLnhO7DRXXgNe
	FI/oToh85/1BhMsBvKiOJ9OWkmt7sr4UgeqSZk7UFI46RSVxA8SgW7P7JUUi374x5LCYV/HJlHi
	KiV2ll8a7KhgLJCrHxfYOsIn79eGyUOB2ErjsuxlGVYpXYCCyxXkzAJNYMEtQCDwWvg6/IB7Ul1
	kuJ87VQ/ZLSJrj6ETd3eWx6fDrkqbr7pohVUKtS0j7z+yY9F4vn/KX9BorRn+JhTD9q2+cgmSTL
	8uznCdIOtLLu6Kew8Y2Eh0m0cbgGmBri7ZTr6kvyDlvyqQWOdKsE4g6krLyRk1jRps08rd+O5vy
	8wIZ5Ur08e42wi+Kqy0Ew3i2NGnPBXfVudkXaFOqNjsWltcG/zpIyeLRWnQWRtoQtm1xryRvMUg
	C5Cy4=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513291cf.8.1774604241578;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr16513091cf.8.1774604241126;
        Fri, 27 Mar 2026 02:37:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:20 -0700 (PDT)
Message-ID: <8feedeb3-e244-4615-b819-dea39300fc2f@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfXwtWi/dvbLeUW
 UFkKnKqKWJdzAbbKl3cwsn73xa2WHaLdG6zE4wXMipWN6HfQie7k+K/gtXd7iR5WC4p+f/JDseC
 SN7w16qDkEaIH4c/RGOJZGcUrzqQ1TdPghJiymwkm6KUT6L/DDufalwwQUb1JmGCAxv0UwwyNlT
 JHnOb65wZ/dpVTB7i/oxoiLCaSZl7NxXNlGCrkBDA/bg6QJEzzOr643Ox87//3yslgEYmNGt7Sr
 97uiC6sF//mpTn7Vq2GaYZV5uCADCemlXaBaM8SjSu0qzu6Wl0kvDIPI9ylba/KYcnjS0KPyBjJ
 Kg7o2v6ublnb2EpFLV4Fx2gLepthJ9nNIfQEesoly+QAmtG8XeuWfYmMMM6MGZAg+b2CuhWrZgn
 1MO+C9wOW8c5rARsIKt7mo4jwUvez1XIMC3uUTSdXbzmT/d/Jh+Q6iSfaDufVPzYWR236hwG0wZ
 dWBG4iT+3aHzWPDDK7Q==
X-Proofpoint-GUID: pZWEVWa6AT3HUeCK_pglb09AzQybwvdl
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c64fd2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S3gobNufr5BrtecctxwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pZWEVWa6AT3HUeCK_pglb09AzQybwvdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100237-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66E2B341EB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

