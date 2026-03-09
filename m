Return-Path: <linux-arm-msm+bounces-96248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hm+Li67rmmxIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:21:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED87238B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC5CC3150184
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B82B3AE1B6;
	Mon,  9 Mar 2026 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmNDQxhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3M89+y1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D83ACF0D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058120; cv=none; b=SoPKEaBlqrEQOnd3v55fZ42fYW5VKkfBcfdt/iiANtI4/vB3ngCkxdg6wPcQ5fMn5SpRmp1dGg29r6FKndYtJLUrbbyC2qWy8VH7hVtDJmiKnPl1MvA/jgir0FZGKfjJadX7w9f9h0iYiw2CjDMNma0rRe03CszEdK6qkalkSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058120; c=relaxed/simple;
	bh=s0Gpr12lLOiMsyPdqj+nFCdGy5NxwGSWZglbiqC3uu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2JnenP3qj9ZHWsZmWr3apo5HkLRwZdx4zB6vdvfQgWklcAGHr0G6rjSvVFo57Ug0IlIEbCgLbu+2esTUJoHjocSCjcKMs2jDjxJQ0LlpNCHkLm+DoyXExG5soXLXuBVmshepMlB2mV34zHnuQeV5w0foJZQ2RGbZWGxEDma3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmNDQxhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3M89+y1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62981Gjv199406
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=; b=XmNDQxhZ0X1qhYj1
	zpRF47+MmyiyPIQwAlbXzz8VIaHswZlNoKD01NdSSka3eRPRrfN6rVhktnBFAQZq
	SZM3ALQMsaftPqD9U2glqbhiCu2/Wyj5FGgDgV2K5A8WS4zzgD7fGuQ//XCxAe0u
	1bNAOyG4JEl8TiAAIN4o/hrI5k0NpjcfqcIdqTqZKsifRZah4H4cmrjmT3wqQlnn
	joRVIGPEuIfCcq5EKBctyX3cJqiyco2kyiBzFQF4CCDkHo4OQfQe6dDqK5HdP9c4
	Q57SKsa++H3d3/psw33+WkY2khiCq9E+CcUz65TVfnoagPdTSRJzXo1RfeeuYC0D
	pxlD6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vda4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:08:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so1337082585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058117; x=1773662917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=;
        b=N3M89+y1xzfRdGUzi10iFqePkpcmqDgyGcceAh+CUKIOg9rXJbLzF7s2Kn4Vf7n0ZQ
         oP3oqx1xTR6upneWl6ekfMvS9gFalqBg8wXGUM64eqbzpvxuqpXNufcrWQI0tXqapGn0
         6erlZsvyAa49cIDWvTwn/FPGE3byK+9YPpy3sUm/PsfruTIzKtuhKBtEzEZvvVxGUqx0
         0ZaapAkEq37eM2P64sHVvXCwYzD0Ep9HX2jcEVEM+QnR2Du5W7jeiE4mxyqQH56XL9Mr
         OtdaYsouzimGiRKJvLvhVNGXlQLbnhoXwwYmmpbxz25TcMNYIavKEc0eQWdFpE8WV81d
         1/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058117; x=1773662917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIycdCMVAHFm2LvzFmzNFCXgiMKffLWzH9oKhlVRQUA=;
        b=t6dL0rxifFYl0wXQbNK4uqffUIOmULYmIB9huRvlt3HZ0SUY+9mtRe/SSb6wO+I5Ps
         1YBu0ohp3z8QcmoEKuOegsmSNbFVBtIbHZjzRTDuPoeyiEBiDLCYWFhA7q9HmnWuBFPS
         ta0B1u85gUQwA8Kii9oTqy37B6BNW8gRmw6fLWKtzvgTlaixiY2y8dYRazyx5KuhGIWw
         3OjveyPFcHJ1j7vhPifXjPYEeVS+SaWqnldBPLu//6NgBzNQXxA40aIbY71AzFchrlNe
         OdnKsdSeG6vqUvORePk1IeCkXDpJALY05POfLCII73oem0UEfEnj2aiA2hdKD1GR9KAV
         lgzA==
X-Forwarded-Encrypted: i=1; AJvYcCUyJXvZCGvpIjgAQ1PlOJ1jznFSBhcR/D34XIPoDcGjc6FSLyb23sSyXZ5n1Xv1dM0Er5O/SpPVNai0Kwmw@vger.kernel.org
X-Gm-Message-State: AOJu0YzWF6k8+i+hHrpkb+ov+YLN8vxpbKnBIU/L8Eq7UY0iWrKOSnOC
	bHyT73Np7TrcnCAnsxxVAGWRKrZoPC0M2Yub3esk9Fup6xxZ7thKDDNxU7cfB4ej7umgVaiiJ0E
	hzGeVNZHAxpmmKXlXzHk91BqnxUTgp8PEupsobrqfRuNwAm+bY6ZCn2PB4Uv0b1ZaVh8K
X-Gm-Gg: ATEYQzz+r/YaHW9xmeqjpARdZOY40SY+sUWgYPTA4gGjdTZxLlKomsY+gpsdXQ/Titr
	oFkTg9qgfuDci08iRnKFzPcJEpcGQnC3CLCez7ulH4ecpJvgFyDJNos+Nqi200CP9Usn3I0fKaE
	rF7JJe8L81qhyKwctz1mk9p+72gE+l8APZ0rjxTcxrBxq0fECw3nRURg29OOoKhd+CCdnB1NCE0
	/WFhWAJ7917ZXQhDplUJqELDdVtX2Sfenumx9m2numpFD0MehNhPwqVtjhqARK9dy8OqLyCrXoc
	n7uwUT7fWWz8QnKpmMHDKZSLKCw4xpXMH51LTW7y4RIcfwamZJYN34iI50i8qo8LapGElYwVsBF
	PsGbHVJRC4oPeRxV3pWgBVwBQ57sSDA==
X-Received: by 2002:a05:620a:112b:b0:8cd:7dfc:ce63 with SMTP id af79cd13be357-8cd7dfcd002mr601168685a.47.1773058117082;
        Mon, 09 Mar 2026 05:08:37 -0700 (PDT)
X-Received: by 2002:a05:620a:112b:b0:8cd:7dfc:ce63 with SMTP id af79cd13be357-8cd7dfcd002mr601165285a.47.1773058116517;
        Mon, 09 Mar 2026 05:08:36 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853916624dsm107826075e9.6.2026.03.09.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:08:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 14:08:16 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v2-1-d7a58a0a9ecb@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2009;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=s0Gpr12lLOiMsyPdqj+nFCdGy5NxwGSWZglbiqC3uu4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprrg6+cp9bXUCSPOuwfVxuUZQhhHmxRHZo3ccM
 iTp4Ysd6TuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa64OgAKCRAbX0TJAJUV
 VoDSEACnyD6DWhAni52yGYdvAhELJv62fTzM42Xw/i52qRUbRaFXbjhinkDI5+o7oZ8nrC6MPse
 DpZ6IquO2/FSQYMN51rKhhPmABuWNE/XJRopBnBBOPR6KHUiUX9fWTEbv06s7dspYUFop4JDGh+
 HcLiu0cSXkr1fhqP8bS5d5ptBk4eovOj2AYfMXBjzi5rSnDKRVCVl/aMU2Dl79CxkN9yw5i6nwD
 GYy7ala3rksFIU0p2XfQwcwPcMgnr5zGjWa7EdU/oMIg0L0pB9O9e5SQxijfU4qWX2j5SGBMVbl
 dLiMbG1Z6nPLoMbOJo1eGsXpgxwh0pj4l9tAbl5OqEtRPFLvtIvHpPT7KC/KqES89TZSmr5c17K
 OgLWJRUPNZUF2V6s1LPaTFa7yZ38fGbgysI1dt4Tn0g/E5gJ3rkoXgYO4wrPywCDswFB6Sf6O+9
 kHyjTRT1AuF5R7ZBbbli1pC4LvsuSCaYBn3mpZjr1AY9lFsOByQxpAWX4Bj730HxvwaZw0Hn6ss
 sk+JYQv8B1lzPcnbQ1lvaiUywwCyb90UQfRsqqroRXcMZELSOIjqvq9FV3EXFXBfROsswAunA2w
 mRpt9A9mDFNH79MyTlVpurDErN2OVcpWMKb6dv6Bs8EAhLM65dRLs/RwDBkpbIwzz56UrMBlaUB
 /phihe6f1eVoAQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: qMbWJQjiZiWA3WoLUXvYmRXUNx60aBu4
X-Proofpoint-GUID: qMbWJQjiZiWA3WoLUXvYmRXUNx60aBu4
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeb845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FB_zh4ukohLvxuHn9zUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMSBTYWx0ZWRfXzPRK7GqKn0U7
 XiBzAXiB2D6S1JjIouZLD+/qqveOt4snuZvaLvSlq1J7A3tmf/qsMCT7tzc/64j+tLIm8mnvLDC
 +Pv+trPCSOCIiMnD+AH5Cyd+CpqRCXKXyz77k3QnEjOW0PECGGXdCSlX5WvxF15fXgMhFw4t1xd
 X7icKh0exNFygnYgma6v9PK8Ah4Uht+Z9gVkJ3aij4G12PRBjhQe+voxX4vu4xeimSOtVgnl9I1
 IWQicqdRHCGZOSTEhCauZ/lS4BeNV8jGEkRdxZQ+sIBoEM3ZOa3E2WkjRELTVkuICdfpRYlZYyo
 x9mRAtD4gbflTCkavZw2vVpYK5I3P/rvOEEf8Hc4LfoyLPktsLR+irpS5GYmnTOSu+ITXHryreJ
 Tc3SCZawVL8Su74Bvn/ooYiVDy6CkCUquF4kke9re0UTC98MPQtB5RhdPvPQx/vgBW/ObOla9VV
 NlQOyK08a9YLOGZH6ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090111
X-Rspamd-Queue-Id: 1ED87238B43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-96248-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.1.134.160:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So document the power domain.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..7a4054c9f215 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,15 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -78,6 +84,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +120,7 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1


