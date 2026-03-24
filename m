Return-Path: <linux-arm-msm+bounces-99711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAVtGN+9wmlflQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:37:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EE3191F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10D7C30ECA35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1A3F167B;
	Tue, 24 Mar 2026 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VudKAD4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBZo4Q0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7153EFD3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369878; cv=none; b=Vr2owIJWQ53WHU7GtKacjLFs3fNmvqDqBeauNd7Piw7axQ2h3zrxw/ATBqVRqTWFvtdvtGEA/5UxFUP7PWKwFueTpZzmA+7iTb1euBiY3y+fc3zaSir9a1EPX5OBjWg6wb341V3O3UZCUiLrL27HfHypQcaijt+VVQyfUp7518Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369878; c=relaxed/simple;
	bh=CBQ/HTj/+gacw7tT3f4qCTthPnRKgqCdg8MA3D487EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9t1k9he2mCA4HrfL1IBgimiR4jPmyR6ftx6I4yHVWYUD1Xny6QRY+lXk9DPYzT+0JyzjFIBCSJ7ptrUYFe5wX/ZNy/DN241yCX+X93hSWwGWy1FFWDvhAG9THZxee/cwAmu8eLRsJ1/zDn04mIzuaKqDDbSjFHIBNmaIDZHS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VudKAD4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBZo4Q0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCE0Qn409123
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cJkVB7soZuEH2OgjtJtIPgf7
	yoWxt/8TCdmxiXUUzOY=; b=VudKAD4M+oCBkzKDzrpsErjKgn0Ss47iVyXroDP3
	1NZuowztNktcYI1SjmnWHcqUfjoXbBVxGOg0ANX2kIY0i5W9yvirD4KKs2NSS964
	s23nh1MEFi9tzx4JicFt21O9UkIdyrlsLUXCnmg8CUBU/NQDSiqkPeagCWDnRYW4
	BuRYHD/ZTw5Yw7/QeS5nzmbqXfsKmUiqtOCI+0NZX93roti/YZb4ncdy/7yXjZy+
	Dg61ZJF5xLBcmXXcXNamZ+oqAiiUU50imkaiPoYUuujB7NyAu37y3d7XuXJr56Qu
	kPFuH5pQpHKp2DJPSXR1gOkwDZ5HvTSZn8Ghr5TPBwsuwA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nextary-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cdaa45becso4413682e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369875; x=1774974675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=OBZo4Q0t6tBTo3L2yu8C4kwJiQ29JF94UxIqXL9lxROWtwz/kBKKkQ6q4t8CzYDqpq
         kc4KyaQJZz1GJo7Z4aZMKt9VSzUcdhPkTfk01P1Z81FlM4R1f5rXvLFojWEolaFBJgXV
         TEx/msJvjS2ZL1chtdVu4+CnJ8exGa21xXF/O0gHZiSPE3UVPDB+d7MKFHvN+gtG0T7D
         1vz0lzCRyNtgvCLsaQ7Lt+4NJNwZ2WeLDO6uvS3v91d4FwgUGWV4ZpwSGBT7jBrzmDKz
         9Tuw550d9ALAvWW7Gjr4VXbZQWayElGE3O23D34SszbpKl2kDsyJp2e9dZgiXg0tUiRO
         TGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369875; x=1774974675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=p8ICnBcdQu2tZbvQzEO3aSn7KPvujhxVAbhkCpXcipRVt41f+blehkr/xf4VWoBNcD
         FPPf+fEmaU5rcC3pyqCRuEwRjTyYjxq1QrJ8FAaBlxRFOwCrodRogoqKer2oTQCIpQCp
         zBKHU08ajqR3W6FRyWgBYGXP2RaTSJAVFCgmqt44MElUAG6YXRcBP5MVUctRx2RvVw+f
         HSoRK8c+7BYVeO1AgZG40sg+sRSQXzpf/N6Cz+GR9uJiypBnkokYekd5L7ASbUdrwFv5
         W8Z5Vm4oKSxR/37LR7m/QKU/mah4xxU3HS55ApoL2xhUCTdJgqCfrDJzR3vyNs1WPx6B
         A9YA==
X-Forwarded-Encrypted: i=1; AJvYcCXnL3407Ft0cmpnzxJr1wCw4vl4mmkh17CYMPR9ZCDfzA8PEP7BIlqYDNUeef6/0MtxolwqHBEGeKsdQ9fw@vger.kernel.org
X-Gm-Message-State: AOJu0YwTOgAYBRq8MuU/137SqydqHVq9eyez+TVQPvEJiBL+EGOFISKR
	1BmrLyG12IcuJY8bbllfzFd3KKrIOIZyQD41/Wo/zRaIkxt1PcS2SInFDHEPiuKHLPWpP7+kBvt
	IE67Wr+6hVNAGPH5CLq1rciMHF8A3fWo4UmWqjCa8d5hdCHRaJZivJIgseNEJT7hXB4ho
X-Gm-Gg: ATEYQzz7kg7bLD63Lr8hFFsx4+4vvpnbmWZZdfY8TPrQVBtuCa2YL3ul3DvtEaeNTxQ
	pbMZsnuMPpWrQ0KZTW4TAdEHghX0Qk5GgPBqMncgWudpQiRDBllDOm7NXMZSAXXD3l/bfn3roud
	36+J8AI3krmn70YMKpnG5HXO5J0SF3lbbmKJloI2INXWT5VqzymtlS5iRLNuN4sfK+tx0LP5Srl
	huBjToMJv2Fe9O/rDj+fbxjNSLO/Yr7PFVelnDNH7egroEk3ei2PbQVc0tQuYW471n/R2AE8Sv/
	RC8xKTD6wl9ZSwa3E5hs6POkdc6hSf5YusKoJRmCyp9+7G4tEAq55y+hefhVis6NDU4fAEX/TVX
	kQEWwTCqQeu00WaFBYuL+drqV0zODIxj7Yg==
X-Received: by 2002:a05:6122:3383:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56d220627a0mr309512e0c.12.1774369875029;
        Tue, 24 Mar 2026 09:31:15 -0700 (PDT)
X-Received: by 2002:a05:6122:3383:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-56d220627a0mr309309e0c.12.1774369873747;
        Tue, 24 Mar 2026 09:31:13 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm121899465e9.7.2026.03.24.09.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:31:12 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:31:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <pvdg745e7gfdsmruhve5u25zkjyvpmudihalojt2hmldbc7mhm@4cj3gyiza4pg>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX4TyNFkQWY5x9
 d/qtS7e/GnDNuQ/zmjkKffWEG3tdWL+3I7xRMAi6aNXBit0mOY9JwqO6y+pvld0oXAsZ2lTXuid
 +fpX4WlY1MLDVlS9t2u7xvU4xx72flmQ7ajFTm312QxT82OKLfEUYRCKsYlqWqDYPZpJC0/fKuT
 HClx3KKMw8jFcOLsuRcKUHLh7YvHeaUKJ+zM6CTzV3VCyX5XxnUOCJB7zF+bZmv/yZqVch9ciPs
 qwR1mQaW8p798RKIuLx/2r1HpSaX9CZLm+8ZfsMRd+iCegBFNQMCHRlgAz0J/R4onveB3OXogFg
 9MNUNDVaxsdVGfCQuZX0ZWmF9AoioT0O0HXfoCqJNSnRNUaLqvL7B3qX8tva8tnLI0JtCHtRB7G
 1bgBTeY6F7/Iuvrp0PS35JDImM0I4u+8CjfcuhC4CiFsu4ji0lvJQNwEEH1qb1wEJn8QoIcXgK9
 4gMe/GxSDooLhIMNUDg==
X-Proofpoint-GUID: EaxSCLow8CBvmvMUwHcr-u5mbgHpUmzd
X-Proofpoint-ORIG-GUID: EaxSCLow8CBvmvMUwHcr-u5mbgHpUmzd
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2bc54 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C60EE3191F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 17:57:57, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

