Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7742B7D9D4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 17:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346188AbjJ0PrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 11:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346143AbjJ0PrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 11:47:18 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B50F196
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 08:47:15 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RAliug013022;
        Fri, 27 Oct 2023 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T9fZQwZWu6UbZgxcxU2sDe4TFAHdUwg74wgvHzD332g=;
 b=bk4iUfHs4MbhjgJMbCTlh4VRFLeMuIRJDLkEedVX5wtUuyrYBfqSuVDZF2rtvxiWwXs5
 KYBnyfVcNOwqKzDb9T7X44DAuZWhQ1Ft6QWprxjbUy/7x/AqTS7VH1UX3vaNLWV8KSRZ
 y0LfydIbO+Z/mKGGMIfYNM2qMVfRJHt7pwdass12NatZVzwxsl2dx/nKP4qgi9yVpMSl
 Zk3rt5ugJioX61nknRp/a1UL9Vt6v+zLC/M6q7shSyrcjBqzyUnOJbAV1NwFyMcC/0py
 5VXxQIsBhS0In2QpVZ2SCeSMg8wqXWrVufEkSk6H9kfVwD+cgO9V6ocgXPgLIChpCLeg Qw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tywvtafka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 15:46:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RFkjEs014177
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 15:46:45 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 08:46:44 -0700
Message-ID: <12471a56-e2bf-c622-29dc-f60459798f85@quicinc.com>
Date:   Fri, 27 Oct 2023 09:46:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/qaic: Enable 1 MSI fallback mode
Content-Language: en-US
To:     <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20231016170036.5409-1-quic_jhugo@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231016170036.5409-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MFgay2gQBJq_wl0DW4fPIrymtImcxXHR
X-Proofpoint-ORIG-GUID: MFgay2gQBJq_wl0DW4fPIrymtImcxXHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_14,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=767 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270136
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/2023 11:00 AM, Jeffrey Hugo wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Several virtualization use-cases either don't support 32 MultiMSIs
> (Xen/VMware) or have significant drawbacks to their use (KVM's vIOMMU,
> which is required to support 32 MSI, needs to allocate an alternate
> system memory space for each device using vIOMMU (e.g. 8GB VM mem and
> 2 cards => 8 + 2 * 8 = 24GB host memory required)). Support these
> cases by enabling a 1 MSI fallback mode.
> 
> Whenever all 32 MSIs requested are not available, a second request for
> a single MSI is made. Its success is the initiator of single MSI mode.
> This mode causes all interrupts generated by the device to be directed
> to the 0th MSI (firmware >=v1.10 will do this as a response to the PCIe
> MSI capability configuration). Likewise, all interrupt handlers for the
> device are registered to the 0th MSI.
> 
> Since the DBC interrupt handler checks if the DBC is in use or if
> there is any pending changes, the 'spurious' interrupts are
> disregarded. If there is work to be done, the standard threaded IRQ
> handler is dispatched.
> 
> On every interrupt, the MHI handler wakes up its threaded interrupt
> handler, and attempts to wake any waiters for MHI state events.
> 
> Performance is within +-0.6% for test cases that typify real world
> use. Larger differences ([-4,+132]%, avg +47%) exist for very simple
> tasks (e.g. addition) compiled for single NSPs. It is assumed that the
> small work and many interrupts typically cause contention (e.g. 16 NSPs
> vs 4 CPUs), as evidenced by the standard deviation between runs also
> decreasing (r=-0.48 between delta(Performace_test) and
> delta(StdDev_test/Avg_test))
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next
